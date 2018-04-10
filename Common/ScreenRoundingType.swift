//
// Created by Jan Kase on 03/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation

/// Standard rounding operation
public protocol ScreenRoundingType {

  /// Type used for rounding operations
  associatedtype Value

  /**

  Function for `value` rounding operation of type `by`.

  - Parameters:
     - value: A value to round
     - by: Type of rounding operation
  - Returns: Rounded value

  */
  func transform(value aValue: Value, by aRoundingRule: FloatingPointRoundingRule) -> Value

}

extension ScreenRoundingType {

  /**
  Default rounding operation.

  - parameter value: Value to round
  - Returns: Rounded value

  */
  public func round(value aValue: Value) -> Value {
    return transform(value: aValue, by: .toNearestOrAwayFromZero)
  }

  /**
  Default ceil operation.

  - parameter value: Value to ceil
  - Returns: Ceiled value

  */
  public func ceil(value aValue: Value) -> Value {
    return transform(value: aValue, by: .up)
  }

  /**
  Default flooring operation.

  - parameter value: Value to floor
  - Returns: Floored value

  */
  public func floor(value aValue: Value) -> Value {
    return transform(value: aValue, by: .down)
  }

}
