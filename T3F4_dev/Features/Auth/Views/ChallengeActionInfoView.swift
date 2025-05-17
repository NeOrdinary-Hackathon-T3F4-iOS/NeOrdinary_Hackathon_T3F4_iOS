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
      Image(type.image)
      
      VStack(spacing: 16) {
        VStack(spacing: 4) {
          Text(type.title)
            .font(AppFont.heading_Medium_bold.font)
            .foregroundStyle(Color(R.Color.text_default.rawValue))
          Text(type.subTitle)
            .font(AppFont.body_medium_medium.font)
            .foregroundStyle(Color(R.Color.text_default.rawValue))
        }
        
        VStack(spacing: 8) {
          Text("인증 요건")
            .font(AppFont.body_medium_bold.font)
            .foregroundStyle(Color(R.Color.text_default.rawValue))
          VStack(spacing: 2) {
            Text(type.authMessage)
              .font(AppFont.body_small_light.font)
              .foregroundStyle(Color(R.Color.text_default.rawValue))
            if type.authSubMessage.isEmpty == false {
              Text(type.authSubMessage)
                .font(AppFont.caption_medium_light.font)
                .foregroundStyle(Color(R.Color.text_subtle.rawValue))
            }
          }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color(R.Color.background_default.rawValue))
        .clipShape(.rect(cornerRadius: 8))
      }
      .frame(maxWidth: .infinity)
      .multilineTextAlignment(.center)
    }
    .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
    .background(Color(R.Color.background_subtle.rawValue))
    .clipShape(.rect(cornerRadius: 16))
  }
}
