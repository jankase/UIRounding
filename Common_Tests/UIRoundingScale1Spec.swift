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
import UIRounding

class UIRoundingScale1Spec: QuickSpec {

  override func spec() {
    var theHelper: RoundingHelper<CGFloat>!
    beforeSuite {
      theHelper = RoundingHelper<CGFloat>(scale: 1)
    }
    describe("rounding") {
      it("round 0.5") {
        expect(theHelper.round(value: 0.5)).to(beCloseTo(1))
      }
      it("round 0.3") {
        expect(theHelper.round(value: 0.3)).to(beCloseTo(0))
      }
      it("round 0.7") {
        expect(theHelper.round(value: 0.7)).to(beCloseTo(1))
      }
      it("round 0.9") {
        expect(theHelper.round(value: 0.9)).to(beCloseTo(1))
      }
      it("round -0.5") {
        expect(theHelper.round(value: -0.5)).to(beCloseTo(-1))
      }
      it("round 0.1") {
        expect(theHelper.round(value: 0.1)).to(beCloseTo(0))
      }
    }
    describe("ceil") {
      it("ceil 0.5") {
        expect(theHelper.ceil(value: 0.5)).to(beCloseTo(1))
      }
      it("ceil 0.3") {
        expect(theHelper.ceil(value: 0.3)).to(beCloseTo(1))
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
      it("ceil 0.1") {
        expect(theHelper.ceil(value: 0.1)).to(beCloseTo(1))
      }
    }
    describe("floor") {
      it("floor 0.5") {
        expect(theHelper.floor(value: 0.5)).to(beCloseTo(0))
      }
      it("floor 0.3") {
        expect(theHelper.floor(value: 0.3)).to(beCloseTo(0))
      }
      it("floor 0.7") {
        expect(theHelper.floor(value: 0.7)).to(beCloseTo(0))
      }
      it("floor 0.9") {
        expect(theHelper.floor(value: 0.9)).to(beCloseTo(0))
      }
      it("floor -0.3") {
        expect(theHelper.floor(value: -0.3)).to(beCloseTo(-1))
      }
      it("floor 0.1") {
        expect(theHelper.floor(value: 0.1)).to(beCloseTo(0))
      }
    }
  }

}
