//
//  ChallengeAuthPhotoSection.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

import Kingfisher

struct ChallengeAuthPhotoSection: View {
  
  // MARK: - Properties
  
  let isAuthCompleted: Bool
  
  // MARK: - View
  
  var body: some View {
    HStack(spacing: 16) {
      KFImage(URL(string: "https://picsum.photos/200/300"))// TODO: - 하드코딩
        .aspectRatio(contentMode: .fit)
        .frame(width: 56, height: 56)
        .clipShape(.rect(cornerRadius: 8))
        .opacity(isAuthCompleted ? 1 : 0.4)
      
      HStack(spacing: 4) {
        Image(isAuthCompleted ? "checkBox" : "hourglass")
        Text(isAuthCompleted ? "인증 완료" : "인증 진행 중")
          .font(AppFont.body_small_bold.font)
          .foregroundStyle(Color(R.Color.neutral_black.rawValue))
      }
      
      Spacer()
      
      Text("2025. 05. 15")
        .font(AppFont.body_small_light.font)
        .foregroundStyle(Color(R.Color.text_inverse.rawValue))
    }
    .frame(maxWidth: .infinity)
    .padding(16)
    .background {
      RoundedRectangle(cornerRadius: 16)
        .strokeBorder(Color(R.Color.neutral_20.rawValue), lineWidth: 1)
        .background(Color(R.Color.background_default.rawValue))
    }
  }
}
