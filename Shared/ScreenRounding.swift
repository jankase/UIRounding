//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import UIKit
import CoreGraphics

public struct ScreenRounding {

  public var screen: UIScreen {
    didSet {
      roundingHelper = RoundingHelper<CGFloat>(scale: screen.scale)
    }
  }

  private (set) public var roundingHelper: RoundingHelper<CGFloat>

  public init(screen aScreen: UIScreen = .main) {
    screen = aScreen
    roundingHelper = RoundingHelper(scale: aScreen.scale)
  }

}
