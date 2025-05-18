//
//  HomeView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct HomeView: View {
  
  @State private var progress: CGFloat = 0.9
  // MARK: - UI
  
  private enum UI {
    static let contentSpacing: CGFloat = 10
  }
  
  // MARK: - View
  var body: some View {
    VStack(spacing: 32) {
      VStack {
        Image("top_logo")
          .padding(.bottom, 8)
      }
      .frame(maxWidth: .infinity)
      .background(.white)
      
      ScrollView {
        VStack(spacing: UI.contentSpacing) {
          // 프로그래스 바
          ProgressBar(
            value: Float(progress),
            height: 24,
            foregroundColor: Color(R.Color.primary_default.rawValue),
            backgroundColor: Color(R.Color.neutral_white.rawValue),
            radius: 12,
            shouldAnimate: true
          )
          
          // 아이템 Section
          ItemSectionView()
          
          // 캐릭터 Section
          CharacterSectionView()
          
          // 챌린지 달성 정보 Section
          ChallengeInfoSectionView()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
      }
      .scrollIndicators(.never)
    }
    .background(Color(R.Color.neutral_20.rawValue))
  }
}

#Preview {
  HomeView()
}
