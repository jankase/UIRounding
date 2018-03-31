//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
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

  public func rounded(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGSize {
    return ScreenRounding(scaleProvider: aScaleProvider).round(size: self)
  }

  public func celled(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGSize {
    return ScreenRounding(scaleProvider: aScaleProvider).ceil(size: self)
  }

  public func floored(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGSize {
    return ScreenRounding(scaleProvider: aScaleProvider).floor(size: self)
  }

  public mutating func round(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) {
    self = rounded(scaleProvider: aScaleProvider)
  }

  public mutating func ceil(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) {
    self = celled(scaleProvider: aScaleProvider)
  }

  public mutating func floor(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) {
    self = floored(scaleProvider: aScaleProvider)
  }

}
