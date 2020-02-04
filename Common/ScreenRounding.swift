//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreGraphics
import Foundation

/**

General class used by specific rounding classes for rounding specific object

*/
public class ScreenRounding {
  /// Source for obtaining scale used by rounding function. Changing value of property update `roundingHelper`.
  public var scaleProvider: ScaleProviderType {
    didSet {
      roundingHelper = RoundingHelper<CGFloat>(scale: scaleProvider.scale)
    }
  }

  /// Class providing elementary rounding support for current scale from `scaleProvider`.
  private (set) public var roundingHelper: RoundingHelper<CGFloat>

  /**

  Default constructor.

  - parameter scaleProvider: Source of scale. By default is main screen for application.

  */
  public init(scaleProvider aScaleProvider: ScaleProviderType = ScaleSource.`default`) {
    scaleProvider = aScaleProvider
    roundingHelper = RoundingHelper(scale: aScaleProvider.scale)
  }
}
