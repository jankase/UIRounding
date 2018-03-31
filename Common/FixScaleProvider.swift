//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics

public struct FixScaleProvider: ScaleProviderType {

  public var scale: CGFloat

  public init(scale aScale: CGFloat) {
    scale = aScale
  }

}
