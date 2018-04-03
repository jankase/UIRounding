//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics

public class SizeScreenRounding: ScreenRounding, ScreenRoundingType {

  public func transform(value aValue: CGSize, by aRoundingRule: FloatingPointRoundingRule) -> CGSize {
    return CGSize(width: roundingHelper.transform(value: aValue.width, byRule: aRoundingRule),
                  height: roundingHelper.transform(value: aValue.height, byRule: aRoundingRule))
  }

}

extension CGSize: ScreenRoundableType {

  public static func screenRounding(scaleProvider aScaleProvider: ScaleProviderType) -> SizeScreenRounding {
    return SizeScreenRounding(scaleProvider: aScaleProvider)
  }

}
