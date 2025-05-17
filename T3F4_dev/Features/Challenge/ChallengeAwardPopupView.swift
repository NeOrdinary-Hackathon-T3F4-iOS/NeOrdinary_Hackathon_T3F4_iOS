//
//  ChallengeAwardPopupView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/18/25.
//

import SwiftUI

struct ChallengeAwardPopupView: View {
  @ObservedObject var viewModel: ChallengeVM
  
  init(of viewModel: ChallengeVM) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    ZStack {
      VStack(spacing: .zero) {
        HStack {
          Spacer()
          Button {
            withoutAnimation {
              viewModel.isAwardItemPopupPresented = false
            }
          } label: {
            Image("x")
          }
        }
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 8))
        
        VStack(spacing: 24) {
          VStack(spacing: 12) {
            Image("item_fertiliser")
              .resizable()
              .frame(width: 140, height: 140)
            
            Text("[ \("비료") ]를 획득하였습니다!")
              .font(AppFont.body_medium_medium.font)
              .foregroundStyle(Color(R.Color.text_default.rawValue))
          }
          
          Button {
            withoutAnimation {
              viewModel.useItem()
            }
          } label: {
            Text("바로 사용하기")
              .font(AppFont.body_medium_medium.font)
              .foregroundStyle(Color(R.Color.neutral_white.rawValue))
              .frame(maxWidth: .infinity)
              .padding(16)
              .background(Color(R.Color.primary_default.rawValue))
              .clipShape(.rect(cornerRadius: 8))
          }
        }
        .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
      }
    }
    .background(Color(R.Color.neutral_white.rawValue))
    .clipShape(.rect(cornerRadius: 16))
    .padding(38)
    .ignoresSafeArea()
    .presentationBackground(
      Color(R.Color.background_inverse.rawValue)
        .opacity(0.7)
    )
  }
}
