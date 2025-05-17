//
//  ChallengeView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI



struct ChallengeView: View {
  
  @StateObject private var viewModel = ChallengeVM()
  
  // MARK: - UI
  private enum UI {
    static let contentSpacing: CGFloat = 16
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
        VStack(spacing: 10) {
          TodayChallengeView(viewModel: viewModel)
          WeeklyChallengeView(viewModel: viewModel)
          
        }.padding(.horizontal, UI.contentSpacing)
        
      }
    }
    .background(Color(R.Color.neutral_20.rawValue))
    .onAppear {
      viewModel.onAppear()
    }
    .refreshable {
      viewModel.refresh()
    }
    .fullScreenCover(isPresented: $viewModel.isChallengeAuthSheetPresented) {
      ChallengeAuthView(
        selectedChallenge: viewModel.selectedChallenge,
        isPresented: $viewModel.isChallengeAuthSheetPresented
      )
    }
    .fullScreenCover(isPresented: $viewModel.isAwardItemPopupPresented) {
      ChallengeAwardPopupView(of: viewModel)
    }
    .fullScreenCover(isPresented: $viewModel.isChallengeAwardSheetPresented) {
      ChallengeAwardView(
        selectedChallenge: viewModel.selectedChallenge,
        isPresented: $viewModel.isChallengeAwardSheetPresented
      )
    }
  }
}
