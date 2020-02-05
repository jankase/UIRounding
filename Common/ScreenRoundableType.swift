//
// Created by Jan Kase on 03/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation

/**
Each element which support basic rounding function based on screen scale should implement this protocol.

Protocol provides default implementation for round, ceil and floor operations (both mutable and immutable version)

*/
public protocol ScreenRoundableType {
  /**
  Rounding function implementation for given roundable type.

  - Important: `Rounder.Value` should be type of `Self` to provide default implementation of rounding functions

  */
  associatedtype Rounder: ScreenRoundingType

  /**
  Create new instance of class providing rounding function for given type of value for given screen scale

  - parameter scaleProvider: provides information about scale used for rounding. Typically reference to screen scale.
     
  - returns: Object providing elementary rounding function for given type of object

  */
  static func screenRounding(scaleProvider aProvider: ScaleProviderType) -> Rounder

}

public extension ScreenRoundableType where Rounder.Value == Self {
  /**
    Provides rounded version of object

    - parameter scaleProvider: provides information about scale used for rounding. Typically reference to screen scale.

    - returns: Rounded version of self

  */
  func rounded(scaleProvider aProvider: ScaleProviderType = ScaleSource.default) -> Self {
    Self.screenRounding(scaleProvider: aProvider).round(value: self)
  }

  /**
  Provides ceiled version of object

  - parameter scaleProvider: provides information about scale used for ceiling. Typically reference to screen scale.
  - returns: Ceiled version of self

  */
  func ceiled(scaleProvider aProvider: ScaleProviderType = ScaleSource.default) -> Self {
    Self.screenRounding(scaleProvider: aProvider).ceil(value: self)
  }

  /**
  Provides floored version of object

  - parameter scaleProvider: provides information about scale used for flooring. Typically reference to screen scale.
  - returns: Floored version of self

  */
  func floored(scaleProvider aProvider: ScaleProviderType = ScaleSource.default) -> Self {
    Self.screenRounding(scaleProvider: aProvider).floor(value: self)
  }

  /**

  Round object.

  - parameter scaleProvider: provides information about scale used for rounding. Typically reference to screen scale.

  */
  mutating func round(scaleProvider aProvider: ScaleProviderType = ScaleSource.default) {
    self = rounded(scaleProvider: aProvider)
  }

  /**

  Ceil object.

  - parameter scaleProvider: provides information about scale used for rounding. Typically reference to screen scale.

  */
  mutating func ceil(scaleProvider aProvider: ScaleProviderType = ScaleSource.default) {
    self = ceiled(scaleProvider: aProvider)
  }

  /**

  Floor object.

  - parameter scaleProvider: provides information about scale used for rounding. Typically reference to screen scale.

  */
  mutating func floor(scaleProvider aProvider: ScaleProviderType = ScaleSource.default) {
    self = floored(scaleProvider: aProvider)
  }
}
