//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreGraphics
import WatchKit

public extension WKInterfaceDevice: ScaleProviderType {
  var scale: CGFloat { screenScale }
}
