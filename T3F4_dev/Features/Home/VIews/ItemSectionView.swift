//
//  ItemSectionView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ItemSectionView: View {
  
  @State private var isZero = true
  @State private var sun = 0
  @State private var wateringCan = 0
  @State private var fertiliser = 0
  @State private var clock = 0

  // MARK: - UI
  
  private enum UI {
    static let contentPadding: CGFloat = 16
    static let contentRadius: CGFloat = 16
    static let textColor = Color(R.Color.neutral_90.rawValue)
    static let backgroundColor = Color(R.Color.neutral_white.rawValue)
  }
  
  // MARK: - View
  
  var body: some View {
    HStack {
    ForEach(ItemType.allCases, id: \.self) { item in
        VStack {
          item.image
          let count = switch item {
          case .sun:
            sun
          case .clock:
            clock
          case .fertiliser:
            fertiliser
          case .wateringCan:
            wateringCan
          }
          Text("\(count)")
            .font(AppFont.body_medium_medium.font)
            .foregroundStyle(count == 0 ? Color(R.Color.text_inverse.rawValue) : UI.textColor)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .padding(UI.contentPadding)
    .background(UI.backgroundColor)
    .clipShape(.rect(cornerRadius: UI.contentRadius))
    .onAppear {
      let uuid = KeyChainManager.shared.getDeviceIdentifierFromKeychain()
      if let uuid {
        APIManager.shared.performRequest(
          .itemCount(uuid: uuid, rewardType: ItemType.sun.serverValue),
          completion: { result in
            switch result {
            case .success(let data):
              do {
                let decoded = try JSONDecoder().decode(ItemCountDto.self, from: data)
                print("여기 응답 성공:", decoded.result)
                let result = decoded.result
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
