//
//  ProgressBar.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/18/25.
//

import SwiftUI

struct ProgressBar: View {
  var value: Float
  var width: CGFloat?
  var height: CGFloat?
  var foregroundColor: Color
  var backgroundColor: Color
  var radius: CGFloat
  var shouldAnimate: Bool
  
  public init(value: Float, width: CGFloat? = nil, height: CGFloat? = nil, foregroundColor: Color, backgroundColor: Color = Color.gray, radius: CGFloat, shouldAnimate: Bool) {
    self.value = value
    self.width = width
    self.height = height
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
    self.radius = radius
    self.shouldAnimate = shouldAnimate
  }
  
  public var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(width: width ?? geometry.size.width, height: height ?? geometry.size.height)
          .foregroundStyle(backgroundColor)
        
        if shouldAnimate {
          RoundedRectangle(cornerRadius: radius)
            .frame(
              width: min(
                CGFloat(
                  self.value
                ) * (
                  width ?? geometry.size.width
                ),
                width ?? geometry.size.width
              ),
              height: height ?? geometry.size.height
            )
            .foregroundColor(foregroundColor)
            .animation(.linear, value: UUID())
        } else {
          RoundedRectangle(cornerRadius: radius)
            .frame(
              width: min(
                CGFloat(self.value) * (
                  width ?? geometry.size.width
                ),
                width ?? geometry.size.width
              ),
              height: height ?? geometry.size.height
            )
            .foregroundColor(foregroundColor)
        }
      }
      .clipShape(.rect(cornerRadius: radius))
    }
    .frame(width: width, height: height)
  }
}
