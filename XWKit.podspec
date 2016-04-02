#
#  Be sure to run `pod spec lint XWKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|
s.name             = "XWKit"
s.version          = "0.0.1"
s.summary          = "A simple Kit player like weico"
s.description      = <<-DESC
A UIKit like weico.
![screenshot](XWKit_logo.gif)
DESC
s.homepage         = "https://github.com/hzx157/XWKit.git"
s.license          = 'MIT'
s.author           = { "Huangzhenxiang" => "317804760@qq.com" }
s.source           = { :git => "https://github.com/hzx157/XWKit.git", :tag => s.version.to_s }
s.social_media_url = 'https://github.com/hzx157'

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'XWKit/**/*'
s.resource_bundles = {

}
# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit'
end
