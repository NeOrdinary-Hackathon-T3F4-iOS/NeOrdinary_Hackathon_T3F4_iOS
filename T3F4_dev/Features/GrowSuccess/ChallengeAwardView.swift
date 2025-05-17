//
//  ChallengeAwardView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/18/25.
//

import SwiftUI

struct ChallengeAwardView: View {
  
  // MARK: - Properties
  
  @State private var isAnimationViewPresented = true
  private var selectedChallenge: ChallengeModel
  @Binding private var isPresented: Bool
  
  // MARK: - Initialize
  
  init(selectedChallenge: ChallengeModel, isPresented: Binding<Bool>) {
    self.selectedChallenge = selectedChallenge
    self._isPresented = isPresented
  }
  
  // MARK: - View
  
  var body: some View {
    if isAnimationViewPresented {
      GrowAnimationView()
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            withoutAnimation {
              isAnimationViewPresented = false
            }
          }
        }
    } else {
      GrowSuccessView()
    }
  }
}
