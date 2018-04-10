//
// Created by Jan Kase on 03/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics
import Nimble
import Quick
@testable import UIRounding

class PointRounding: QuickSpec {

  override func spec() {
    super.spec()
    describe("Point rounding helper with scale 3") {
      self._pointSpecs.forEach { self._test(spec: $0) }
    }
  }

  private var _pointSpecs: [RoundingSpec<CGPoint>] = [
    RoundingSpec<CGPoint>(inputValue: CGPoint(x: 0.5, y: 0.5),
                          roundResult: CGPoint(x: 0.6666, y: 0.6666),
                          ceilResult: CGPoint(x: 0.6666, y: 0.6666),
                          floorResult: CGPoint(x: 0.3333, y: 0.3333)),
    RoundingSpec<CGPoint>(inputValue: CGPoint(x: 0.3, y: 0.3),
                          roundResult: CGPoint(x: 0.3333, y: 0.3333),
                          ceilResult: CGPoint(x: 0.3333, y: 0.3333),
                          floorResult: CGPoint(x: 0, y: 0)),
    RoundingSpec<CGPoint>(inputValue: CGPoint(x: 0.7, y: 0.7),
                          roundResult: CGPoint(x: 0.6666, y: 0.6666),
                          ceilResult: CGPoint(x: 1, y: 1),
                          floorResult: CGPoint(x: 0.6666, y: 0.6666)),
    RoundingSpec<CGPoint>(inputValue: CGPoint(x: 0.9, y: 0.9),
                          roundResult: CGPoint(x: 1, y: 1),
                          ceilResult: CGPoint(x: 1, y: 1),
                          floorResult: CGPoint(x: 0.6666, y: 0.6666)),
    RoundingSpec<CGPoint>(inputValue: CGPoint(x: 0.1, y: 0.1),
                          roundResult: CGPoint(x: 0, y: 0),
                          ceilResult: CGPoint(x: 0.3333, y: 0.3333),
                          floorResult: CGPoint(x: 0, y: 0)),
    RoundingSpec<CGPoint>(inputValue: CGPoint(x: -0.3, y: -0.3),
                          roundResult: CGPoint(x: -0.3333, y: -0.3333),
                          ceilResult: CGPoint(x: 0, y: 0),
                          floorResult: CGPoint(x: -0.3333, y: -0.3333))
  ]

  private func _test(spec aSpec: RoundingSpec<CGPoint>) {
    let theScaleProvider = FixScaleProvider(scale: 3)
    var aPoint: CGPoint!
    beforeEach {
      aPoint = aSpec.inputValue
    }
    it("round \(aSpec.inputValue)") {
      aPoint.round(scaleProvider: theScaleProvider)
      self._expectClosePoints(aPoint, aSpec.roundResult)
    }
    it("ceil \(aSpec.inputValue)") {
      aPoint.ceil(scaleProvider: theScaleProvider)
      self._expectClosePoints(aPoint, aSpec.ceilResult)
    }
    it ("floor \(aSpec.inputValue)") {
      aPoint.floor(scaleProvider: theScaleProvider)
      self._expectClosePoints(aPoint, aSpec.floorResult)
    }
  }

  private func _expectClosePoints(_ aLhs: CGPoint, _ aRhs: CGPoint) {
    expect(aLhs.x).to(beCloseTo(aRhs.x))
    expect(aLhs.y).to(beCloseTo(aRhs.y))
  }

}
