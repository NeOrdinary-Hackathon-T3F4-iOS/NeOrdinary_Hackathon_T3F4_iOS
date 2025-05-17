//
//  AppFont.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

enum AppFont {
  case heading_large_bold
  case heading_large_medium
  case heading_large_light
  case heading_Medium_bold
  case heading_Medium_medium
  case heading_Medium_light
  case body_large_bold
  case body_large_medium
  case body_large_light
  case body_medium_bold
  case body_medium_medium
  case body_medium_light
  case body_small_bold
  case body_small_medium
  case body_small_light
  case caption_medium_light
  
  var uiFont: UIFont {
    switch self {
    case .heading_large_bold:
      return FontManager.shared.bold(ofSize: 32)
    case .heading_large_medium:
      return FontManager.shared.medium(ofSize: 32)
    case .heading_large_light:
      return FontManager.shared.light(ofSize: 32)
    case .heading_Medium_bold:
      return FontManager.shared.bold(ofSize: 24)
    case .heading_Medium_medium:
      return FontManager.shared.medium(ofSize: 24)
    case .heading_Medium_light:
      return FontManager.shared.light(ofSize: 24)
    case .body_large_bold:
      return FontManager.shared.bold(ofSize: 18)
    case .body_large_medium:
      return FontManager.shared.medium(ofSize: 18)
    case .body_large_light:
      return FontManager.shared.light(ofSize: 18)
    case .body_medium_bold:
      return FontManager.shared.bold(ofSize: 16)
    case .body_medium_medium:
      return FontManager.shared.medium(ofSize: 16)
    case .body_medium_light:
      return FontManager.shared.light(ofSize: 16)
    case .body_small_bold:
      return FontManager.shared.bold(ofSize: 14)
    case .body_small_medium:
      return FontManager.shared.medium(ofSize: 14)
    case .body_small_light:
      return FontManager.shared.light(ofSize: 14)
    case .caption_medium_light:
      return FontManager.shared.light(ofSize: 12)
    }
  }
  
  var font: Font {
      return Font(uiFont)
  }
}
