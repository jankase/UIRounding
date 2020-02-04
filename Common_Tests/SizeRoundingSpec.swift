//
// Created by Jan Kase on 04/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import CoreGraphics
import Foundation
import Nimble
import Quick
@testable import UIRounding

class SizeRoundingSpec: QuickSpec {
  override func spec() {
    describe("Size rounding helper with scale 3") {
      //swiftlint:disable:next quick_discouraged_call
      _specs.forEach(self._test)
    }

  }

  private var _specs: [RoundingSpec<CGSize>] = [
    RoundingSpec(inputValue: CGSize(width: 0.3, height: 0.3),
                 roundResult: CGSize(width: 0.3333, height: 0.3333),
                 ceilResult: CGSize(width: 0.3333, height: 0.3333),
                 floorResult: CGSize(width: 0, height: 0)),
    RoundingSpec(inputValue: CGSize(width: 0.5, height: 0.5),
                 roundResult: CGSize(width: 0.6666, height: 0.6666),
                 ceilResult: CGSize(width: 0.6666, height: 0.6666),
                 floorResult: CGSize(width: 0.3333, height: 0.3333)),
    RoundingSpec(inputValue: CGSize(width: 0.7, height: 0.7),
                 roundResult: CGSize(width: 0.6666, height: 0.6666),
                 ceilResult: CGSize(width: 1, height: 1),
                 floorResult: CGSize(width: 0.6666, height: 0.6666)),
    RoundingSpec(inputValue: CGSize(width: 0.9, height: 0.9),
                 roundResult: CGSize(width: 1, height: 1),
                 ceilResult: CGSize(width: 1, height: 1),
                 floorResult: CGSize(width: 0.6666, height: 0.6666)),
    RoundingSpec(inputValue: CGSize(width: 0.1, height: 0.1),
                 roundResult: CGSize(width: 0, height: 0),
                 ceilResult: CGSize(width: 0.3333, height: 0.3333),
                 floorResult: CGSize(width: 0, height: 0)),
    RoundingSpec(inputValue: CGSize(width: -0.1, height: -0.1),
                 roundResult: CGSize(width: 0, height: 0),
                 ceilResult: CGSize(width: 0, height: 0),
                 floorResult: CGSize(width: -0.3333, height: -0.3333))
  ]

  private func _test(specs aSpec: RoundingSpec<CGSize>) {
    let theScaleProvider = FixScaleProvider(scale: 3)
    //swiftlint:disable:next implicitly_unwrapped_optional
    var aSize: CGSize!
    beforeEach {
      aSize = aSpec.inputValue
    }
    it("round \(aSpec.inputValue)") {
      aSize.round(scaleProvider: theScaleProvider)
      self._expectCloseSize(aSize, aSpec.roundResult)
    }
    it("ceil \(aSpec.inputValue)") {
      aSize.ceil(scaleProvider: theScaleProvider)
      self._expectCloseSize(aSize, aSpec.ceilResult)
    }
    it("floor \(aSpec.inputValue)") {
      aSize.floor(scaleProvider: theScaleProvider)
      self._expectCloseSize(aSize, aSpec.floorResult)
    }
  }

  private func _expectCloseSize(_ aLhs: CGSize, _ aRhs: CGSize) {
    expect(aLhs.width).to(beCloseTo(aRhs.width))
    expect(aRhs.height).to(beCloseTo(aRhs.height))
  }
}
