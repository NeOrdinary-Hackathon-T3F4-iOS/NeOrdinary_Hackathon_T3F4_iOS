//
//  ChallengeInfoSectionView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeInfoSectionView: View {
  
  // MARK: - Properties
  
  @State var weeklyModels: [ChallengeModel] = []
  @State var todayModels: [ChallengeModel] = []
  
  // MARK: - UI
  
  private enum UI {
    static let contentSpacing: CGFloat = 16
    static let contentPadding: CGFloat = 16
    static let contentRadius: CGFloat = 16
    static let textColor = Color(R.Color.neutral_90.rawValue)
    static let backgroundColor = Color(R.Color.neutral_white.rawValue)
  }
  
  // MARK: - View
  
  var body: some View {
    VStack(spacing: UI.contentSpacing) {
      ChallengeInfoView(model: $todayModels, type: .today)
      ChallengeInfoView(model: $weeklyModels, type: .weekly)
      MotivationLabel()
    }
    .frame(maxWidth: .infinity)
    .padding(UI.contentPadding)
    .background(UI.backgroundColor)
    .clipShape(.rect(cornerRadius: UI.contentRadius))
    .onAppear {
      fetchChallengeList()
    }
  }
  
  private func fetchChallengeList() {
    let uuid = KeyChainManager.shared.getDeviceIdentifierFromKeychain()
    if let uuid {
      APIManager.shared.performRequest(
        .missions(uuid: uuid),
        completion: { result in
          switch result {
          case .success(let data):
            do {
              let decoded = try JSONDecoder().decode(MissionDto.self, from: data)
              print("응답 성공:", decoded.result)
              let result = decoded.result

              // 주간 도전 과제
              let weeklyModels = result
                .filter { $0.periodType == ChallengeType.weekly.rawValue }
                .map { model in
                  ChallengeModel(
                    id: model.id,
                    name: model.title,
                    status: StatusType(fromAPI: model.status),
                    itemType: ItemType(fromAPI: model.reward),
                    challengeType: .weekly
                  )
                }
              self.weeklyModels = weeklyModels

              // 일일 도전 과제
              let todayModels = result
                .filter { $0.periodType == ChallengeType.today.rawValue }
                .map { model in
                  ChallengeModel(
                    id: model.id,
                    name: model.title,
                    status: StatusType(fromAPI: model.status),
                    itemType: ItemType(fromAPI: model.reward),
                    challengeType: .today
                  )
                }
              self.todayModels = todayModels
            } catch {
              print("디코딩 에러:", error)
            }
          case .failure(let error):
            print("요청 에러:", error)
          }
        }
      )
    }
  }
}

private extension ChallengeInfoSectionView {
  struct ChallengeInfoView: View {
    
    // MARK: - Properties
    
    @Binding var model: [ChallengeModel]
    let type: ChallengeType
    
    // MARK: - UI
    
    private enum UI {
      static let contentSpacing: CGFloat = 8
      static let contentRadius: CGFloat = 8
      static let contentPadding = EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
      static let backgroundColor = Color(R.Color.primary_subtle.rawValue)
    }
    
    // MARK: View
    
    var body: some View {
      HStack {
        Text(type.title)
          .font(AppFont.body_medium_medium.font)
          .foregroundStyle(Color(R.Color.neutral_black.rawValue))
        Spacer()
        HStack(spacing: UI.contentSpacing) {
          Text("\(model.filter({ $0.status != .nonComplete }).count)")
            .font(AppFont.heading_Medium_bold.font)
            .foregroundStyle(Color(R.Color.primary_default.rawValue))
          Text("/")
            .font(AppFont.body_medium_medium.font)
            .foregroundStyle(Color(R.Color.neutral_90.rawValue))
          Text("\(model.count)")
            .font(AppFont.body_large_bold.font)
            .foregroundStyle(Color(R.Color.neutral_90.rawValue))
        }
      }
      .padding(UI.contentPadding)
      .background(Color(R.Color.neutral_10.rawValue))
      .clipShape(.rect(cornerRadius: UI.contentRadius))
    }
  }
  
  struct MotivationLabel: View {
    
    // MARK: - UI
    
    private enum UI {
      static let contentPadding: CGFloat = 8
      static let contentRadius: CGFloat = 8
      static let backgroundColor = Color(R.Color.primary_subtle.rawValue)
    }
    
    // MARK: View
    
    var body: some View {
      Text("오늘도 힘내서 제로 웨이스트 실천해보아요")
        .font(AppFont.body_small_light.font)
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity)
        .padding(UI.contentPadding)
        .background(UI.backgroundColor)
        .clipShape(.rect(cornerRadius: UI.contentRadius))
    }
  }
}
