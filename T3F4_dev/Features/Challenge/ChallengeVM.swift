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
    
    func onAppear() {
        
        weeklyModels = [
            ChallengeModel(
                name:"음식 남기지 않기",
                status: .complete,
                itemType: .clock
            ),
            ChallengeModel(
                name:"음식 남기지 않기",
                status: .getAward,
                itemType: .fertiliser
            )
        ]
        
        todayModels = [
            ChallengeModel(
                name:"음식 남기지 않기",
                status: .nonComplte,
                itemType: .sun
            ),
            ChallengeModel(
                name:"음식 남기지 않기",
                status: .nonComplte,
                itemType: .wateringCan
            )
        ]
        
    }
}

