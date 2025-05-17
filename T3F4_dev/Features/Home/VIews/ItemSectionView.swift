//
//  ItemSectionView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ItemSectionView: View {
  
  @State private var isZero = true
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
          Text("0") // TODO: - 현재 하드코딩, DB에서 받아오기
            .font(AppFont.body_medium_medium.font)
            .foregroundStyle(isZero ? Color(R.Color.text_inverse.rawValue) : UI.textColor)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .padding(UI.contentPadding)
    .background(UI.backgroundColor)
    .clipShape(.rect(cornerRadius: UI.contentRadius))
  }
}
