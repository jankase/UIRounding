//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
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

  public func rounded(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGPoint {
    return ScreenRounding(scaleProvider: aScaleProvider).round(point: self)
  }

  public func celled(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGPoint {
    return ScreenRounding(scaleProvider: aScaleProvider).ceil(point: self)
  }

  public func floored(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGPoint {
    return ScreenRounding(scaleProvider: aScaleProvider).floor(point: self)
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
