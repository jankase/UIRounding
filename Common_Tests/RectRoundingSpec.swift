//
// Created by Jan Kase on 04/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreGraphics
import Foundation
import Nimble
import Quick
@testable import UIRounding

class RectRoundingSpec: QuickSpec {
  override func spec() {
    describe("Rectangle rounding with scale 3") {
      //swiftlint:disable:next quick_discouraged_call
      self._specs.forEach(self._test)
    }
  }

  private let _specs: [RoundingSpec<CGRect>] = [
    RoundingSpec(inputValue: CGRect(x: 0.5, y: 0.5, width: 2.5, height: 2.5),
                 roundResult: CGRect(x: 0.6666, y: 0.6666, width: 2.6666, height: 2.6666),
                 ceilResult: CGRect(x: 0.3333, y: 0.3333, width: 2.6666, height: 2.6666),
                 floorResult: CGRect(x: 0.6666, y: 0.6666, width: 2.3333, height: 2.3333)),
    RoundingSpec(inputValue: CGRect(x: 0.3, y: 0.3, width: 2.3, height: 2.3),
                 roundResult: CGRect(x: 0.3333, y: 0.3333, width: 2.3333, height: 2.3333),
                 ceilResult: CGRect(x: 0, y: 0, width: 2.3333, height: 2.3333),
                 floorResult: CGRect(x: 0.3333, y: 0.3333, width: 2, height: 2)),
    RoundingSpec(inputValue: CGRect(x: 0.7, y: 0.7, width: 2.7, height: 2.7),
                 roundResult: CGRect(x: 0.6666, y: 0.6666, width: 2.6666, height: 2.6666),
                 ceilResult: CGRect(x: 0.6666, y: 0.6666, width: 3, height: 3),
                 floorResult: CGRect(x: 1, y: 1, width: 2.6666, height: 2.6666)),
    RoundingSpec(inputValue: CGRect(x: 0.9, y: 0.9, width: 2.9, height: 2.9),
                 roundResult: CGRect(x: 1, y: 1, width: 3, height: 3),
                 ceilResult: CGRect(x: 0.6666, y: 0.6666, width: 3, height: 3),
                 floorResult: CGRect(x: 1, y: 1, width: 2.6666, height: 2.6666)),
    RoundingSpec(inputValue: CGRect(x: 0.1, y: 0.1, width: 2.1, height: 2.1),
                 roundResult: CGRect(x: 0, y: 0, width: 2, height: 2),
                 ceilResult: CGRect(x: 0, y: 0, width: 2.3333, height: 2.3333),
                 floorResult: CGRect(x: 0.3333, y: 0.3333, width: 2, height: 2)),
    RoundingSpec(inputValue: CGRect(x: -0.3, y: -0.3, width: -2.3, height: -2.3),
                 roundResult: CGRect(x: -0.3333, y: -0.3333, width: -2.3333, height: -2.3333),
                 ceilResult: CGRect(x: 0, y: 0, width: -2.3333, height: -2.3333),
                 floorResult: CGRect(x: -0.3333, y: -0.3333, width: -2, height: -2))
  ]

  private func _test(spec aSpec: RoundingSpec<CGRect>) {
    let theScaleProvider = FixScaleProvider(scale: 3)
    context("Performing operation on \(aSpec.inputValue)") {
      //swiftlint:disable:next implicitly_unwrapped_optional
      var theRect: CGRect!
      beforeEach {
        theRect = aSpec.inputValue
      }
      it("round") {
        theRect.round(scaleProvider: theScaleProvider)
        self._closeToRect(theRect, aSpec.roundResult)
      }
      it("ceil") {
        theRect.ceil(scaleProvider: theScaleProvider)
        self._closeToRect(theRect, aSpec.ceilResult)
      }
      it("floor") {
        theRect.floor(scaleProvider: theScaleProvider)
        self._closeToRect(theRect, aSpec.floorResult)
      }

    }
  }

  private func _closeToRect(_ aLhs: CGRect, _ aRhs: CGRect) {
    expect(aLhs.origin.x).to(beCloseTo(aRhs.origin.x))
    expect(aLhs.origin.y).to(beCloseTo(aRhs.origin.y))
    expect(aLhs.width).to(beCloseTo(aRhs.width))
    expect(aLhs.height).to(beCloseTo(aRhs.height))
  }
}
