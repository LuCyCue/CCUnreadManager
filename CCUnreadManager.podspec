#
# Be sure to run `pod lib lint CCUnreadManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CCUnreadManager'
  s.version          = '0.1.0'
  s.summary          = 'App红点处理联动更新解决方案'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  App红点处理联动更新解决方案, 统一管理红点，联动更新
                       DESC

  s.homepage         = 'https://github.com/LuCyCue/CCUnreadManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lucc' => 'lccjust123@163.com' }
  s.source           = { :git => 'https://github.com/LuCyCue/CCUnreadManager.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'CCUnreadManager/Classes/**/*'
  s.dependency 'Masonry', '1.1.0'
  # s.resource_bundles = {
  #   'CCUnreadManager' => ['CCUnreadManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
