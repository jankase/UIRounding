//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Cocoa

public struct ScaleSource {
  public static var `default`: ScaleProviderType = NSScreen.main ?? FixScaleProvider(scale: 1)
}
