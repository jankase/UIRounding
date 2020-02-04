//
// Created by Jan Kase on 31/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import UIKit

/// Provides reference to default `ScaleProviderType` for given operating system.
public struct ScaleSource {
  /// Default screen in system used as source of scale information for correct rounding by functions.
  public static var `default`: ScaleProviderType = UIScreen.main
}
