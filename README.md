
# UIRounding

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
![license](https://img.shields.io/github/license/jankase/UIRounding.svg?style=flat-square)
![Travis branch](https://img.shields.io/travis/jankase/UIRounding/master.svg?style=flat-square)
![Test](https://cocoapod-badges.herokuapp.com/v/UIRounding/badge.png)
[![Maintainability](https://api.codeclimate.com/v1/badges/31b9e4d32060fe758224/maintainability)](https://codeclimate.com/github/jankase/UIRounding/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/31b9e4d32060fe758224/test_coverage)](https://codeclimate.com/github/jankase/UIRounding/test_coverage)

Simple rounding helper for pixel rounding based on your screen.

Standard way to obtain rounding helper.

```swift
let rh = ScreenRounding().roundingHelper
```

For rounding is used method on rounding helper like following:

```swift
let ceil = rh.ceil(0.2)
let round = rh.round(0.2)
let floor = rh.floor(0.2)
```

There is also extension of standard Core graphics structures:

```swift
let roundedPoint = CGPoint(x: 0.2, y: 2.0).round()
let ceilSize = CGSize(width: 0.2, height: 2.0).ceil()
let floorRect = CGRect(origin: CGPoint(x: 0.2, y: 2.0), size: CGSize(width: 0.2, height: 2.0)).floor()
```
