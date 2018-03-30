//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import UIKit
import CoreGraphics

extension ScreenRounding {

  public func round(rect aRect: CGRect) -> CGRect {
    return transform(rect: aRect, originRounding: .toNearestOrAwayFromZero, sizeRoundingRule: .toNearestOrAwayFromZero)
  }

  public func ceil(rect aRect: CGRect) -> CGRect {
    return transform(rect: aRect, originRounding: .towardZero, sizeRoundingRule: .awayFromZero)
  }

  public func floor(rect aRect: CGRect) -> CGRect {
    return transform(rect: aRect, originRounding: .awayFromZero, sizeRoundingRule: .towardZero)
  }

  public func transform(rect aRect: CGRect,
                        originRounding anOriginRoundingRule: FloatingPointRoundingRule = .down,
                        sizeRoundingRule aSizeRoundingRule: FloatingPointRoundingRule = .up) -> CGRect {
    return CGRect(origin: transform(point: aRect.origin, by: anOriginRoundingRule),
                  size: transform(size: aRect.size, by: aSizeRoundingRule))
  }

}

extension CGRect {

  public func rounded(screen aScreen: UIScreen = .main) -> CGRect {
    return ScreenRounding(screen: aScreen).round(rect: self)
  }

  public func celled(screen aScreen: UIScreen = .main) -> CGRect {
    return ScreenRounding(screen: aScreen).ceil(rect: self)
  }

  public func floored(screen aScreen: UIScreen = .main) -> CGRect {
    return ScreenRounding(screen: aScreen).floor(rect: self)
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
