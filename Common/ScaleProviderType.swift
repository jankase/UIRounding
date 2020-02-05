//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreGraphics
import Foundation

/// Type able to provide scale
public protocol ScaleProviderType {
  /// scale used for rounding
  var scale: CGFloat { get }
}
