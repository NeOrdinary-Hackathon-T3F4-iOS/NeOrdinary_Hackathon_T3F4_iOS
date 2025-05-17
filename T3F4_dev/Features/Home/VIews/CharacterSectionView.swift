//
//  CharacterSectionView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct CharacterSectionView: View {
  
  // MARK: - UI
  
  private enum UI {
    static let contentSpacing: CGFloat = 10
    static let contentPadding = EdgeInsets(top: 16, leading: 0, bottom: 24, trailing: 0)
    static let contentRadius: CGFloat = 16
    static let textColor = Color(R.Color.text_default.rawValue)
    static let backgroundColor = Color(R.Color.background_subtle.rawValue)
  }
  
  // MARK: - View
  
  var body: some View {
    VStack(spacing: UI.contentSpacing) {
      Image("character_default")
      Text("새싹이") // TODO: - 현재 하드코딩, DB에서 받아오기
        .foregroundStyle(UI.textColor)
    }
    .frame(maxWidth: .infinity)
    .padding(UI.contentPadding)
    .background(UI.backgroundColor)
    .clipShape(.rect(cornerRadius: UI.contentRadius))
  }
}
