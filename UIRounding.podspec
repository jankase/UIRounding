#
#  Be sure to run `pod spec lint UIRounding.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "UIRounding"
  s.version      = "0.0.2"
  s.summary      = "Simple helper for perform pixel perfect rounding of CoreGraphics elements"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  #s.description  = <<-DESC
  #                 DESC

  s.homepage     = "https://github.com/jankase/UIRounding"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Jan Kase" => "jan.kase@me.com" }

  s.ios.deployment_target     = "8.0"
  s.osx.deployment_target     = "10.11"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target    = "9.0"

  s.source        = { :git => "https://github.com/jankase/UIRounding.git", :tag => "#{s.version}" }

  s.ios.source_files     = "Common/*.swift", "Common/iOS_tvOS/**/*.swift", "UIRounding_iOS/**/*.swift"
  s.osx.source_files     = "Common/*.swift", "UIRounding_macOS/**/*.swift"
  s.tvos.source_files    = "Common/*.swift", "Common/iOS_tvOS/**/*.swift", "UIRounding_tvOS/**/*.swift"
  s.watchos.source_files = "Common/*.swift", "UIRounding_watchOS/**/*.swift"

  # s.public_header_files = "Classes/**/*.h"

  s.ios.frameworks     = "CoreGraphics", "Foundation", "UIKit"
  s.osx.frameworks     = "CoreGraphics", "Foundation", "Cocoa"
  s.tvos.frameworks    = "CoreGraphics", "Foundation", "UIKit"
  s.watchos.frameworks = "CoreGraphics", "Foundation", "WatchKit"

end
