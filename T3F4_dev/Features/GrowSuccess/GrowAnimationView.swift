//
//  GrowAnimationView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/18/25.
//

import SwiftUI

import Lottie

struct GrowAnimationView: View {
  
  @State private var isFirstAnimation = true
  
  // MARK: - View
  
  var body: some View {
    ZStack {
      Color(R.Color.neutral_20.rawValue)
      
      VStack(spacing: 24) {
        LottieView(animation: .named(isFirstAnimation ? "fertilising_animation" : "oing_animation"))
          .playing(loopMode: .autoReverse)
        
        Text(isFirstAnimation ? "비료 뿌리는 중.." : "오잉?")
          .font(AppFont.body_medium_bold.font)
          .foregroundStyle(Color(R.Color.text_default.rawValue))
          .frame(maxWidth: .infinity)
          .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
          .background(Color(R.Color.neutral_white.rawValue))
          .clipShape(.rect(cornerRadius: 16))
      }
      .padding(.horizontal, 30)
    }
    .ignoresSafeArea()
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        withoutAnimation {
          isFirstAnimation = false
        }
      }
    }
  }
}
