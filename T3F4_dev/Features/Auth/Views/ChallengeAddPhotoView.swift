//
//  ChallengeAddPhotoView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeAddPhotoView: View {
  
  // MARK: - View
  
  var body: some View {
    Button {
      // TODO: - 카메라 컨트롤러로
    } label: {
      HStack(spacing: 16) {
        Image("plus")
          .padding(16)
          .background(Color(R.Color.background_subtle.rawValue))
          .clipShape(.rect(cornerRadius: 8))
        
        Text("챌린지 인증 사진을 등록해주세요.")
          .font(AppFont.body_small_light.font)
          .foregroundStyle(Color(R.Color.text_subtle.rawValue))
        
        Spacer()
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
}
