#
# Be sure to run `pod lib lint YLNetClient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLNetClient'
  s.version          = '0.1.0'
  s.summary          = 'A Tools of Network.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A Tools of Network use easy.'

  s.homepage         = 'https://github.com/cloverapp1/YLNetClient.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '2510479687@qq.com' => '2510479687@qq.com' }
  s.source           = { :git => 'https://github.com/2510479687@qq.com/YLNetClient.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YLNetClient/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YLNetClient' => ['YLNetClient/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking','~>3.2.1'
  s.dependency 'YLJsonLib','~>0.1.7'
  s.dependency 'MBProgressHUD','~>1.1.0'
end
