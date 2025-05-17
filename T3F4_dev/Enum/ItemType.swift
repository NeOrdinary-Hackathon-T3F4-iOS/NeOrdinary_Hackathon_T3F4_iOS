//
//  ItemType.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import Foundation
import SwiftUI

enum ItemType: CaseIterable {
  case sun
  case clock
  case fertiliser
  case wateringCan
}

extension ItemType {
  var image: Image {
    switch self {
    case .sun:
      Image("item_clock")
    case .clock:
      Image("item_fertiliser")
    case .fertiliser:
      Image("item_sun")
    case .wateringCan:
      Image("item_wateringCan")
    }
  }
}
