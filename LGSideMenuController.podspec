Pod::Spec.new do |s|
    s.name = 'LGSideMenuController'
    s.version = '3.1.3'
    s.license = { type: 'MIT', file: 'LICENSE' }
    s.homepage = 'https://github.com/LGLibs/LGSideMenuController'
    s.author = { 'Grigorii Lutkov': 'grigorii@lutkov.dev' }
    s.source = { git: 'https://github.com/LGLibs/LGSideMenuController.git', tag: s.version }
    s.summary = 'iOS view controller which manages left and right side views'
    s.platform = :ios, '12.0'
    s.swift_version = '5.0'
    s.source_files = 'LGSideMenuController/**/*.swift'
    s.framework = 'Foundation', 'CoreGraphics', 'QuartzCore', 'UIKit'
end
