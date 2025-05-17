//
//  ChallengeVM.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import Combine

class ChallengeVM: ObservableObject {
  
  @Published var weeklyModels: [ChallengeModel] = []
  @Published var todayModels: [ChallengeModel] = []
  @Published var isChallengeAuthSheetPresented = false
  @Published var isChallengeAwardSheetPresented = false
  @Published var isAwardItemPopupPresented = false
  private(set) var selectedChallenge: ChallengeModel = .empty
  
  func onAppear() {
    
    weeklyModels = [
      ChallengeModel(
        name:"음식 남기지 않기",
        status: .complete,
        itemType: .clock,
        challengeType: .today
      ),
      ChallengeModel(
        name:"음식 남기지 않기",
        status: .getAward,
        itemType: .fertiliser,
        challengeType: .today
      )
    ]
    
    todayModels = [
      ChallengeModel(
        name:"음식 남기지 않기",
        status: .nonComplte,
        itemType: .sun,
        challengeType: .weekly
      ),
      ChallengeModel(
        name:"음식 남기지 않기",
        status: .nonComplte,
        itemType: .wateringCan,
        challengeType: .weekly
      )
    ]
    
  }
  
  func showChallengeAuthSheet(to selectedChallenge: ChallengeModel) {
    self.selectedChallenge = selectedChallenge
    if selectedChallenge.status == .getAward {
      isAwardItemPopupPresented = true
    } else {
      isChallengeAuthSheetPresented = true
    }
  }
  
  func useItem() {
    isAwardItemPopupPresented = false
    isChallengeAwardSheetPresented = true
  }
}

