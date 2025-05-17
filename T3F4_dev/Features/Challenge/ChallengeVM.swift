//
//  ChallengeVM.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import Combine
import SwiftUI

class ChallengeVM: ObservableObject {
  
  @Published var weeklyModels: [ChallengeModel] = []
  @Published var todayModels: [ChallengeModel] = []
  @Published var isChallengeAuthSheetPresented = false
  @Published var isChallengeAwardSheetPresented = false
  @Published var isAwardItemPopupPresented = false
  private(set) var selectedChallenge: ChallengeModel = .empty
  
  func onAppear() {
    fetchChallengeList()
  }
  
  func refresh() {
    fetchChallengeList()
  }
  
  private func fetchChallengeList() {
    let uuid = KeyChainManager.shared.getDeviceIdentifierFromKeychain()
    if let uuid {
      APIManager.shared.performRequest(
        .missions(uuid: uuid),
        completion: { result in
          switch result {
          case .success(let data):
            do {
              let decoded = try JSONDecoder().decode(MissionDto.self, from: data)
              print("응답 성공:", decoded.result)
              let result = decoded.result
              let weeklyModels = result.filter { $0.periodType == ChallengeType.weekly.rawValue }
              let todayModels = result.filter { $0.periodType == ChallengeType.today.rawValue }
              weeklyModels.forEach { model in
                self.weeklyModels.append(
                  ChallengeModel(
                    id: model.id,
                    name: model.title,
                    status: StatusType(fromAPI: model.status),
                    itemType: ItemType(fromAPI: model.reward),
                    challengeType: .weekly
                  )
                )
              }
              
              todayModels.forEach { model in
                self.todayModels.append(
                  ChallengeModel(
                    id: model.id,
                    name: model.title,
                    status: StatusType(fromAPI: model.status),
                    itemType: ItemType(fromAPI: model.reward),
                    challengeType: .weekly
                  )
                )
              }
            } catch {
              print("디코딩 에러:", error)
            }
          case .failure(let error):
            print("요청 에러:", error)
          }
        }
      )
    }
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

/*
 weeklyModels = [
   ChallengeModel(
     name:"음식 남기지 않기",
     status: .complete,
     itemType: .clock,
     challengeType: .weekly
   ),
   ChallengeModel(
     name:"음식 남기지 않기",
     status: .getAward,
     itemType: .fertiliser,
     challengeType: .weekly
   )
 ]
 
 todayModels = [
   ChallengeModel(
     name:"음식 남기지 않기",
     status: .nonComplte,
     itemType: .sun,
     challengeType: .today
   ),
   ChallengeModel(
     name:"음식 남기지 않기",
     status: .nonComplte,
     itemType: .wateringCan,
     challengeType: .today
   )
 ]
 */
