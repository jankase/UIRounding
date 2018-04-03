//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics

public class PointScreenRounding: ScreenRounding, ScreenRoundingType {

  public func transform(value aValue: CGPoint, by aRoundingRule: FloatingPointRoundingRule) -> CGPoint {
    return CGPoint(x: roundingHelper.transform(value: aValue.x, byRule: aRoundingRule),
                   y: roundingHelper.transform(value: aValue.y, byRule: aRoundingRule))
  }
}

extension CGPoint: ScreenRoundableType {

  public static func screenRounding(scaleProvider aScaleProvider: ScaleProviderType) -> PointScreenRounding {
    return PointScreenRounding(scaleProvider: aScaleProvider)
  }

}
