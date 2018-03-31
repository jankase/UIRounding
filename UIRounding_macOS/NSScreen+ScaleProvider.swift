//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Cocoa
import CoreGraphics

extension NSScreen: ScaleProviderType {

  public var scale: CGFloat {
    return backingScaleFactor
  }

}
