//
// Created by Jan Kase on 30/03/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics
import Quick
import Nimble
import UIRounding

class UIRoundingScale3Spec: QuickSpec {

  override func spec() {
    var theHelper: RoundingHelper<CGFloat>!
    beforeSuite {
      theHelper = RoundingHelper<CGFloat>(scale: 3)
    }
    describe("rounding") {
      it("round 0.5") {
        expect(theHelper.round(value: 0.5)).to(beCloseTo(0.6666))
      }
      it("round 0.3") {
        expect(theHelper.round(value: 0.3)).to(beCloseTo(0.3333))
      }
      it("round 0.7") {
        expect(theHelper.round(value: 0.7)).to(beCloseTo(0.6666))
      }
      it("round 0.9") {
        expect(theHelper.round(value: 0.9)).to(beCloseTo(1))
      }
      it("round -0.5") {
        expect(theHelper.round(value: -0.5)).to(beCloseTo(-0.6666))
      }
      it("round 0.1") {
        expect(theHelper.round(value: 0.1)).to(beCloseTo(0))
      }
    }
    describe("ceil") {
      it("ceil 0.5") {
        expect(theHelper.ceil(value: 0.5)).to(beCloseTo(0.6666))
      }
      it("ceil 0.3") {
        expect(theHelper.ceil(value: 0.3)).to(beCloseTo(0.3333))
      }
      it("ceil 0.7") {
        expect(theHelper.ceil(value: 0.7)).to(beCloseTo(1))
      }
      it("ceil 0.9") {
        expect(theHelper.ceil(value: 0.9)).to(beCloseTo(1))
      }
      it("ceil -0.3") {
        expect(theHelper.ceil(value: -0.3)).to(beCloseTo(0))
      }
      it("round 0.1") {
        expect(theHelper.ceil(value: 0.1)).to(beCloseTo(0.3333))
      }
    }
    describe("floor") {
      it("floor 0.5") {
        expect(theHelper.floor(value: 0.5)).to(beCloseTo(0.3333))
      }
      it("floor 0.3") {
        expect(theHelper.floor(value: 0.3)).to(beCloseTo(0))
      }
      it("floor 0.7") {
        expect(theHelper.floor(value: 0.7)).to(beCloseTo(0.6666))
      }
      it("floor 0.9") {
        expect(theHelper.floor(value: 0.9)).to(beCloseTo(0.6666))
      }
      it("floor -0.3") {
        expect(theHelper.floor(value: -0.3)).to(beCloseTo(-0.3333))
      }
      it("floor 0.1") {
        expect(theHelper.floor(value: 0.1)).to(beCloseTo(0))
      }
    }
  }

}
