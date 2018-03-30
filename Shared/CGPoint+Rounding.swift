//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import UIKit
import CoreGraphics

extension ScreenRounding {

  public func round(point aPoint: CGPoint) -> CGPoint {
    return transform(point: aPoint, by: .toNearestOrAwayFromZero)
  }

  public func ceil(point aPoint: CGPoint) -> CGPoint {
    return transform(point: aPoint, by: .awayFromZero)
  }

  public func floor(point aPoint: CGPoint) -> CGPoint {
    return transform(point: aPoint, by: .towardZero)
  }

  public func transform(point aPoint: CGPoint, by aRoundingRule: FloatingPointRoundingRule) -> CGPoint {
    return CGPoint(x: roundingHelper.transform(value: aPoint.x, byRule: aRoundingRule),
        y: roundingHelper.transform(value: aPoint.y, byRule: aRoundingRule))
  }

}

extension CGPoint {

  public func rounded(screen aScreen: UIScreen = .main) -> CGPoint {
    let theScreenRounding = ScreenRounding(screen: aScreen)
    return theScreenRounding.round(point: self)
  }

  public func celled(screen aScreen: UIScreen = .main) -> CGPoint {
    let theScreenRounding = ScreenRounding(screen: aScreen)
    return theScreenRounding.ceil(point: self)
  }

  public func floored(screen aScreen: UIScreen = .main) -> CGPoint {
    let theScreenRounding = ScreenRounding(screen: aScreen)
    return theScreenRounding.floor(point: self)
  }

  public mutating func round(screen aScreen: UIScreen = .main) {
    self = rounded(screen: aScreen)
  }

  public mutating func ceil(screen aScreen: UIScreen = .main) {
    self = celled(screen: aScreen)
  }

  public mutating func floor(screen aScreen: UIScreen = .main) {
    self = floored(screen: aScreen)
  }

}
