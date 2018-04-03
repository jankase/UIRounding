//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics

public class ScreenRounding {

  public var scaleProvider: ScaleProviderType {
    didSet {
      roundingHelper = RoundingHelper<CGFloat>(scale: scaleProvider.scale)
    }
  }

  private (set) public var roundingHelper: RoundingHelper<CGFloat>

  public init(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.`default`) {
    scaleProvider = aScaleProvider
    roundingHelper = RoundingHelper(scale: aScaleProvider.scale)
  }

}
