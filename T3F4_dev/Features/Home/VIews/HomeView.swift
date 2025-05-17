//
//  HomeView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct HomeView: View {
  
  // MARK: - UI
  
  private enum UI {
    static let contentSpacing: CGFloat = 10
  }
  
  // MARK: - View
  
  var body: some View {
    ScrollView {
      VStack(spacing: UI.contentSpacing) {
        // 프로그래스 바
        ProgressView()
          .progressViewStyle(.linear)
        
        // 아이템 Section
        ItemSectionView()
        
        // 캐릭터 Section
        HStack {
          
        }
        .frame(height: 200) //
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 24, trailing: 0))
        .background(Color(R.Color.background_subtle.rawValue))
        
        // 챌린지 달성 정보 Section
        HStack {
          
        }
        .frame(height: 200) //
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
        .background(Color(R.Color.neutral_white.rawValue))
      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal, 16)
    }
    .background(Color(R.Color.neutral_10.rawValue))
    .scrollIndicators(.never)
  }
}

#Preview {
  HomeView()
}
