//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import UIKit
import CoreGraphics

extension ScreenRounding {

  public func round(size aSize: CGSize) -> CGSize {
    return transform(size: aSize, by: .toNearestOrAwayFromZero)
  }

  public func ceil(size aSize: CGSize) -> CGSize {
    return transform(size: aSize, by: .awayFromZero)
  }

  public func floor(size aSize: CGSize) -> CGSize {
    return transform(size: aSize, by: .towardZero)
  }

  public func transform(size aSize: CGSize, by aRoundingRule: FloatingPointRoundingRule) -> CGSize {
    return CGSize(width: roundingHelper.transform(value: aSize.width, byRule: aRoundingRule),
        height: roundingHelper.transform(value: aSize.height, byRule: aRoundingRule))
  }

}

extension CGSize {

  public func rounded(screen aScreen: UIScreen = .main) -> CGSize {
    return ScreenRounding(screen: aScreen).round(size: self)
  }

  public func celled(screen aScreen: UIScreen = .main) -> CGSize {
    return ScreenRounding(screen: aScreen).ceil(size: self)
  }

  public func floored(screen aScreen: UIScreen = .main) -> CGSize {
    return ScreenRounding(screen: aScreen).floor(size: self)
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
