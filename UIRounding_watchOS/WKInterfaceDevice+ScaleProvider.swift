//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import WatchKit
import CoreGraphics

extension WKInterfaceDevice: ScaleProviderType {

  public var scale: CGFloat {
    return screenScale
  }

}
