//
//  ChallengeInfoSectionView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeInfoSectionView: View {
  
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
      ChallengeInfoView(type: .today)
      ChallengeInfoView(type: .weekly)
      MotivationLabel()
    }
    .frame(maxWidth: .infinity)
    .padding(UI.contentPadding)
    .background(UI.backgroundColor)
    .clipShape(.rect(cornerRadius: UI.contentRadius))
  }
}

private extension ChallengeInfoSectionView {
  struct ChallengeInfoView: View {
    
    // MARK: - Properties
    
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
        Spacer()
        HStack(spacing: UI.contentSpacing) {
          Text("1")
            .foregroundStyle(Color(R.Color.primary_default.rawValue))
          Text("/")
          Text("2")
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
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity)
        .padding(UI.contentPadding)
        .background(UI.backgroundColor)
        .clipShape(.rect(cornerRadius: UI.contentRadius))
    }
  }
}
