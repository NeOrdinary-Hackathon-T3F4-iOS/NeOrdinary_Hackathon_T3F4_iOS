//
//  ChallengeModel.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import Foundation

struct ChallengeModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var status: StatusType
    var itemType: ItemType
    var challengeType: ChallengeType
  
  static let empty = ChallengeModel(
    name: "",
    status: .nonComplte,
    itemType: .clock,
    challengeType: .today
  )
}
