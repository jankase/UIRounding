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
      for theScale in 1...3 {
        context("with scale \(theScale)") {
          _test(scale: CGFloat(theScale), specs: _scaleSpecs[theScale - 1])
        }
      }
    }
  }

  private let _scaleSpecs: [[RoundingSpec<CGFloat>]] = [
    [
      RoundingSpec<CGFloat>(inputValue: 0.5, roundResult: 1, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.3, roundResult: 0, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.7, roundResult: 1, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.9, roundResult: 1, ceilResult: 1, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: -0.3, roundResult: 0, ceilResult: 0, floorResult: -1),
      RoundingSpec<CGFloat>(inputValue: 0.1, roundResult: 0, ceilResult: 1, floorResult: 0)
    ],
    [
      RoundingSpec<CGFloat>(inputValue: 0.5, roundResult: 0.5, ceilResult: 0.5, floorResult: 0.5),
      RoundingSpec<CGFloat>(inputValue: 0.3, roundResult: 0.5, ceilResult: 0.5, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.7, roundResult: 0.5, ceilResult: 1, floorResult: 0.5),
      RoundingSpec<CGFloat>(inputValue: 0.9, roundResult: 1, ceilResult: 1, floorResult: 0.5),
      RoundingSpec<CGFloat>(inputValue: -0.3, roundResult: -0.5, ceilResult: 0, floorResult: -0.5),
      RoundingSpec<CGFloat>(inputValue: 0.1, roundResult: 0, ceilResult: 0.5, floorResult: 0)
    ],
    [
      RoundingSpec<CGFloat>(inputValue: 0.5, roundResult: 0.6666, ceilResult: 0.6666, floorResult: 0.3333),
      RoundingSpec<CGFloat>(inputValue: 0.3, roundResult: 0.3333, ceilResult: 0.3333, floorResult: 0),
      RoundingSpec<CGFloat>(inputValue: 0.7, roundResult: 0.6666, ceilResult: 1, floorResult: 0.6666),
      RoundingSpec<CGFloat>(inputValue: 0.9, roundResult: 1, ceilResult: 1, floorResult: 0.6666),
      RoundingSpec<CGFloat>(inputValue: -0.3, roundResult: -0.3333, ceilResult: 0, floorResult: -0.3333),
      RoundingSpec<CGFloat>(inputValue: 0.1, roundResult: 0, ceilResult: 0.3333, floorResult: 0)
    ]
  ]

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

  private func _test(scale aScale: CGFloat, specs aSpecs: [RoundingSpec<CGFloat>]) {
    let theHelper = RoundingHelper(scale: aScale)
    aSpecs.forEach { self._test(roundingHelper: theHelper, specification: $0) }
  }

}
