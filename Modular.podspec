#
# Be sure to run `pod lib lint Modular.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Modular'
    s.version          = '0.0.1'
    s.summary          = 'More uniform layout with less code. Built on SnapKit.'

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC

    s.homepage         = 'https://github.com/manGoweb/Modular'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Ondrej Rafaj' => 'developers@mangoweb.cz' }
    s.source           = { :git => 'https://github.com/manGoweb/Modular.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/rafiki270'


    s.ios.deployment_target = '9.2'
    s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '9.2'

    s.source_files = 'Modular/Classes/**/*'

    # s.resource_bundles = {
    #   'Modular' => ['Modular/Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'SnapKit'
end