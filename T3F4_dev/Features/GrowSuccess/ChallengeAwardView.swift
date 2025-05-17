//
//  ChallengeAwardView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/18/25.
//

import SwiftUI

struct ChallengeAwardView: View {
  
  // MARK: - Properties
  
  private var selectedChallenge: ChallengeModel
  @Binding private var isPresented: Bool
  
  // MARK: - Initialize
  
  init(selectedChallenge: ChallengeModel, isPresented: Binding<Bool>) {
    self.selectedChallenge = selectedChallenge
    self._isPresented = isPresented
  }
  
  // MARK: - View
  

  var body: some View {
    GrowSuccessView()
  }
}
