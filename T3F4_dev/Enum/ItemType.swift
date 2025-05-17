//
//  ItemType.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import Foundation
import SwiftUI

enum ItemType: String, CaseIterable {
  case sun
  case wateringCan
  case fertiliser
  case clock
  
  init(fromAPI value: String) {
    switch value.uppercased() {
    case "SUN":
      self = .sun
    case "POT":
      self = .wateringCan
    case "TIME":
      self = .clock
    case "FERTILIZER":
      self = .fertiliser
    default:
      self = .sun // or fatalError / throw error, depending on your strategy
    }
  }
}

extension ItemType {
  var image: Image {
    switch self {
    case .sun:
      Image("item_sun")
    case .clock:
      Image("item_clock")
    case .fertiliser:
      Image("item_fertiliser")
    case .wateringCan:
      Image("item_wateringCan")
    }
  }
}
