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
//    setTest()
    fetchChallengeList()
  }
  
  func refresh() {
//    setTest()
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

              // 주간 도전 과제
              let weeklyModels = result
                .filter { $0.periodType == ChallengeType.weekly.rawValue }
                .map { model in
                  ChallengeModel(
                    id: model.id,
                    name: model.title,
                    status: StatusType(fromAPI: model.status),
                    itemType: ItemType(fromAPI: model.reward),
                    challengeType: .weekly
                  )
                }
              self.weeklyModels = weeklyModels

              // 일일 도전 과제
              let todayModels = result
                .filter { $0.periodType == ChallengeType.today.rawValue }
                .map { model in
                  ChallengeModel(
                    id: model.id,
                    name: model.title,
                    status: StatusType(fromAPI: model.status),
                    itemType: ItemType(fromAPI: model.reward),
                    challengeType: .today
                  )
                }
              self.todayModels = todayModels
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
  
  func setTest() {
    todayModels = [
      ChallengeModel(
        id: 1,
        name:"음식 남기지 않기",
        status: .nonComplete,
        itemType: .sun,
        challengeType: .today
      ),
      ChallengeModel(
        id: 2,
        name:"페트병 라벨 제거해서 버리기",
        status: .nonComplete,
        itemType: .sun,
        challengeType: .today
      )
    ]
    
    weeklyModels = [
      ChallengeModel(
        id: 3,
        name:"매일 텀블러 사용",
        status: .nonComplete,
        itemType: .sun,
        challengeType: .weekly
      ),
      ChallengeModel(
        id: 4,
        name:"다회용기 챙겨서 테이크아웃",
        status: .nonComplete,
        itemType: .wateringCan,
        challengeType: .weekly
      ),
      ChallengeModel(
        id: 5,
        name:"플로깅 2회 이상",
        status: .nonComplete,
        itemType: .fertiliser,
        challengeType: .weekly
      ),
      ChallengeModel(
        id: 6,
        name:"업사이클링 실천",
        status: .nonComplete,
        itemType: .clock,
        challengeType: .weekly
      )
    ]
  }
}
