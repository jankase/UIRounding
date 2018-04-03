//
// Created by Jan Kase on 03/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation

public protocol ScreenRoundableType {

  associatedtype Rounder: ScreenRoundingType

  static func screenRounding(scaleProvider aProvider: ScaleProviderType) -> Rounder

}

extension ScreenRoundableType where Rounder.Value == Self {

  public func rounded(scaleProvider aProvider: ScaleProviderType) -> Self {
    return Self.screenRounding(scaleProvider: aProvider).round(value: self)
  }

  public func celled(scaleProvider aProvider: ScaleProviderType) -> Self {
    return Self.screenRounding(scaleProvider: aProvider).ceil(value: self)
  }

  public func floored(scaleProvider aProvider: ScaleProviderType) -> Self {
    return Self.screenRounding(scaleProvider: aProvider).floor(value: self)
  }

  public mutating func round(scaleProvider aProvider: ScaleProviderType) {
    self = rounded(scaleProvider: aProvider)
  }

  public mutating func ceil(scaleProvider aProvider: ScaleProviderType) {
    self = celled(scaleProvider: aProvider)
  }

  public mutating func floor(scaleProvider aProvider: ScaleProviderType) {
    self = floored(scaleProvider: aProvider)
  }

}
