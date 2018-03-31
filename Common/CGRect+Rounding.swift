//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
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

  public func rounded(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGRect {
    return ScreenRounding(scaleProvider: aScaleProvider).round(rect: self)
  }

  public func celled(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGRect {
    return ScreenRounding(scaleProvider: aScaleProvider).ceil(rect: self)
  }

  public func floored(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.default) -> CGRect {
    return ScreenRounding(scaleProvider: aScaleProvider).floor(rect: self)
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
