//
// Created by Jan Kase on 02/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreGraphics
import Foundation

struct RoundingSpec<T> {
  var inputValue: T
  var roundResult: T
  var ceilResult: T
  var floorResult: T
}
