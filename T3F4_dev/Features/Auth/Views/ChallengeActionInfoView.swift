//
//  ChallengeActionInfoView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeActionInfoView: View {

  let type: MissionType
  
  // MARK: - View
  
  var body: some View {
    VStack(spacing: 24) {
      Image("detail_fertiliser")
      
      VStack(spacing: 16) {
        VStack(spacing: 4) {
          Text("플로깅 2회 이상")
            .font(AppFont.heading_Medium_bold.font)
            .foregroundStyle(Color(R.Color.text_default.rawValue))
          Text("조깅하며 길가 쓰레기 수거하기")
            .font(AppFont.body_medium_medium.font)
            .foregroundStyle(Color(R.Color.text_default.rawValue))
        }
        
        VStack(spacing: 8) {
          Text("인증 요건")
            .font(AppFont.body_medium_bold.font)
            .foregroundStyle(Color(R.Color.text_default.rawValue))
          VStack(spacing: 2) {
            Text("플로깅 수행 여부가 명확히 드러나는 사진 2장 이상")
              .font(AppFont.body_small_light.font)
              .foregroundStyle(Color(R.Color.text_default.rawValue))
            Text("(ex. 플로깅 용품, 쓰레기 담긴 봉투 등)")
              .font(AppFont.caption_medium_light.font)
              .foregroundStyle(Color(R.Color.text_subtle.rawValue))
          }
        }
        .padding(16)
        .background(Color(R.Color.background_default.rawValue))
        .clipShape(.rect(cornerRadius: 8))
      }
      .multilineTextAlignment(.center)
    }
    .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
    .background(Color(R.Color.background_subtle.rawValue))
    .clipShape(.rect(cornerRadius: 16))
  }
}
