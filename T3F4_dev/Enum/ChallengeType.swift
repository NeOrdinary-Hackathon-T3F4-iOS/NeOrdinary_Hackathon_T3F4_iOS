//
//  ChallengeType.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import Foundation

enum ChallengeType {
  case today
  case weekly
}

extension ChallengeType {
  var title: String {
    switch self {
    case .today:
      "하루 챌린지"
    case .weekly:
      "주간 챌린지"
    }
  }
}
