//
//  UIRounding_iOSTests.swift
//  UIRounding_iOSTests
//
//  Created by Jan Kase on 29/03/2018.
//  Copyright © 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics
import Quick
import Nimble
@testable import UIRounding

class UIRoundingScaleSpec: QuickSpec {

  override func spec() {
    describe("RoundingHelper") {
      context("with scale 1") {
        _testScale1()
      }
      context("with scale 2") {
        _testScale2()
      }
      context("with scale 3") {
        _testScale3()
      }
    }
  }

  private func _test(roundingHelper aHelper: RoundingHelper<CGFloat>,
                     specification aSpecification: RoundingSpec<CGFloat>) {
    context("when provided \(aSpecification.inputValue)") {
      it("round to \(aSpecification.roundResult)") {
        expect(aHelper.round(value: aSpecification.inputValue)).to(beCloseTo(aSpecification.roundResult))
      }
      it("ceil to \(aSpecification.ceilResult)") {
        expect(aHelper.ceil(value: aSpecification.inputValue)).to(beCloseTo(aSpecification.ceilResult))
      }
      it("floor to \(aSpecification.floorResult)") {
        expect(aHelper.floor(value: aSpecification.inputValue)).to(beCloseTo(aSpecification.floorResult))
      }
    }
  }

  private func _testScale1() {
    let theHelper = RoundingHelper<CGFloat>(scale: 1)
    let theSpecs = [
      RoundingSpec<CGFloat>(inputValue: 0.5, roundResult: 1, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.3, roundResult: 0, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.7, roundResult: 1, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.9, roundResult: 1, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: -0.3, roundResult: 0, ceilResult: 0, floorResult: -1),
      RoundingSpec<CGFloat>(inputValue: 0.1, roundResult: 0, ceilResult: 1, floorResult: 0)
    ]
    theSpecs.forEach { self._test(roundingHelper: theHelper, specification: $0) }
  }

  private func _testScale2() {
    let theHelper = RoundingHelper<CGFloat>(scale: 2)
    let theSpecs = [
      RoundingSpec<CGFloat>(inputValue: 0.5, roundResult: 0.5, ceilResult: 0.5, floorResult: 0.5),
      RoundingSpec<CGFloat>(inputValue: 0.3, roundResult: 0.5, ceilResult: 0.5, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.7, roundResult: 0.5, ceilResult: 1, floorResult: 0.5),
      RoundingSpec<CGFloat>(inputValue: 0.9, roundResult: 1, ceilResult: 1, floorResult: 0.5),
      RoundingSpec<CGFloat>(inputValue: -0.3, roundResult: -0.5, ceilResult: 0, floorResult: -0.5),
      RoundingSpec<CGFloat>(inputValue: 0.1, roundResult: 0, ceilResult: 0.5, floorResult: 0)
    ]
    theSpecs.forEach { self._test(roundingHelper: theHelper, specification: $0) }
  }

  private func _testScale3() {
    let theHelper = RoundingHelper<CGFloat>(scale: 3)
    let theSpecs = [
      RoundingSpec<CGFloat>(inputValue: 0.5, roundResult: 0.6666, ceilResult: 0.6666, floorResult: 0.3333),
      RoundingSpec<CGFloat>(inputValue: 0.3, roundResult: 0.3333, ceilResult: 0.3333, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.7, roundResult: 0.6666, ceilResult: 1, floorResult: 0.6666),
      RoundingSpec<CGFloat>(inputValue: 0.9, roundResult: 1, ceilResult: 1, floorResult: 0.6666),
      RoundingSpec<CGFloat>(inputValue: -0.3, roundResult: -0.3333, ceilResult: 0, floorResult: -0.3333),
      RoundingSpec<CGFloat>(inputValue: 0.1, roundResult: 0, ceilResult: 0.3333, floorResult: 0)
    ]
    theSpecs.forEach { self._test(roundingHelper: theHelper, specification: $0) }
  }

}
