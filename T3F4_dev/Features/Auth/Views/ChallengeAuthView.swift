//
//  ChallengeAuthView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeAuthView: View {
  
  // MARK: - Properties
  
  private var selectedChallenge: ChallengeModel
  @State private var detail: MissionStatResult = .empty
  let type: MissionType
  @Binding private var isPresented: Bool
  
  // MARK: - Initialize
  
  init(selectedChallenge: ChallengeModel, isPresented: Binding<Bool>) {
    self.selectedChallenge = selectedChallenge
    self._isPresented = isPresented
    type = MissionType(fromTitle: selectedChallenge.name)
  }
  
  // MARK: - View
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          ChallengeActionInfoView(type: type)
          VStack(spacing: 16) {
            
            let remaining = max(detail.countReward - detail.images.count, 0)
            ForEach(0..<remaining, id: \.self) { _ in
              ChallengeAddPhotoView(selectedChallenge: selectedChallenge, type: type)
            }
            
            ForEach(detail.images, id: \.self) { image in
              ChallengeAuthPhotoSection(urlString: image.imageURL, isAuthCompleted: true)
            }
          }
          Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
      }
      .navigationTitle(selectedChallenge.challengeType.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            isPresented = false
          } label: {
            Image("x")
          }
        }
      }
    }
    .onAppear {
      let uuid = KeyChainManager.shared.getDeviceIdentifierFromKeychain()
      if let uuid {
        APIManager.shared.performRequest(
          .mission(uuid: uuid, id: selectedChallenge.id),
          completion: { result in
            switch result {
            case .success(let data):
              do {
                let decoded = try JSONDecoder().decode(MissionStatDto.self, from: data)
                print("응답 성공:", decoded.result)
                let result = decoded.result
                detail = result
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
}
