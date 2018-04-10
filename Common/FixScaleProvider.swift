//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics

/// Scale provider with specified scale. Used for testing and in case monitor not attached in macOS.
public struct FixScaleProvider: ScaleProviderType {

  /// Scale used by other rounding operations
  public var scale: CGFloat

  /**

  Default constructor.

  - parameter scale: Scale used by other rounding operations

  */
  public init(scale aScale: CGFloat) {
    scale = aScale
  }

}
