Pod::Spec.new do |s|
    s.name = 'UIRounding'
    s.version = '0.1.0'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.homepage = 'https://github.com/jankase/UIRounding'
    s.author = { 'Jan Kase' => 'jan.kase@jkdev.eu' }
    s.summary = 'Simple helper for perform pixel perfect rounding of CoreGraphics elements'
    s.swift_version = '5.0'

    s.ios.deployment_target = '8.0'
    s.osx.deployment_target = '10.10'
    s.watchos.deployment_target = '2.0'
    s.tvos.deployment_target = '9.0'

    s.source = { :git => 'https://github.com/jankase/UIRounding.git', :tag => "#{s.version}" }

    s.ios.source_files     = "Common/*.swift", "Common/iOS_tvOS/**/*.swift", "UIRounding_iOS/**/*.swift"
    s.osx.source_files     = "Common/*.swift", "UIRounding_macOS/**/*.swift"
    s.tvos.source_files    = "Common/*.swift", "Common/iOS_tvOS/**/*.swift", "UIRounding_tvOS/**/*.swift"
    s.watchos.source_files = "Common/*.swift", "UIRounding_watchOS/**/*.swift"

    s.ios.frameworks     = "CoreGraphics", "Foundation", "UIKit"
    s.osx.frameworks     = "CoreGraphics", "Foundation", "Cocoa"
    s.tvos.frameworks    = "CoreGraphics", "Foundation", "UIKit"
    s.watchos.frameworks = "CoreGraphics", "Foundation", "WatchKit"
end
