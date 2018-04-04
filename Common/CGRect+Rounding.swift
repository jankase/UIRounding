//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics

public class RectScreenRounding: ScreenRounding, ScreenRoundingType {

  public func transform(value aValue: CGRect, by aRoundingRule: FloatingPointRoundingRule) -> CGRect {
    let theOriginRoundingRule: FloatingPointRoundingRule
    let theSizeRoundingRule: FloatingPointRoundingRule
    switch aRoundingRule {
    case .up:
      theOriginRoundingRule = .towardZero
      theSizeRoundingRule = .awayFromZero
    case .down:
      theOriginRoundingRule = .awayFromZero
      theSizeRoundingRule = .towardZero
    case .toNearestOrAwayFromZero:
      theOriginRoundingRule = .toNearestOrAwayFromZero
      theSizeRoundingRule = .toNearestOrAwayFromZero
    default: fatalError()
    }
    return CGRect(origin: CGPoint.screenRounding(scaleProvider: scaleProvider).transform(value: aValue.origin,
                                                                                         by: theOriginRoundingRule),
                  size: CGSize.screenRounding(scaleProvider: scaleProvider).transform(value: aValue.size,
                                                                                      by: theSizeRoundingRule))
  }

}

extension CGRect: ScreenRoundableType {

  public static func screenRounding(scaleProvider aScaleProvider: ScaleProviderType) -> RectScreenRounding {
    return RectScreenRounding(scaleProvider: aScaleProvider)
  }

}
