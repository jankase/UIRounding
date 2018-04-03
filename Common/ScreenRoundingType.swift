//
// Created by Jan Kase on 03/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation

public protocol ScreenRoundingType {

  associatedtype Value

  func transform(value aValue: Value, by aRoundingRule: FloatingPointRoundingRule) -> Value

}

extension ScreenRoundingType {

  public func round(value aValue: Value) -> Value {
    return transform(value: aValue, by: .toNearestOrAwayFromZero)
  }

  public func ceil(value aValue: Value) -> Value {
    return transform(value: aValue, by: .awayFromZero)
  }

  public func floor(value aValue: Value) -> Value {
    return transform(value: aValue, by: .towardZero)
  }

}
