//
// Created by Jan Kase on 28/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation

public struct RoundingHelper<T: FloatingPoint> {

  public var scale: T = 1

  public init(scale aScale: T) {
    scale = aScale
  }

  public func ceil(value aSource: T) -> T {
    return transform(value: aSource, byRule: .up)
  }

  public func floor(value aSource: T) -> T {
    return transform(value: aSource, byRule: .down)
  }

  public func round(value aSource: T) -> T {
    return transform(value: aSource, byRule: .toNearestOrAwayFromZero)
  }

  public func transform(value aSource: T, byRule aRule: FloatingPointRoundingRule) -> T {
    return (aSource * scale).rounded(aRule) / scale
  }

}
