require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-google-ad-manager"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-google-ad-manager
                   DESC
  s.homepage     = "https://gitlab.com/cmsw/react-native-google-ad-manager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Callosum Software" => "oss@callosum-sw.de" }
  s.platforms    = { :ios => "9.0", :tvos => "10.0" }
  s.source       = { :git => "https://gitlab.com/cmsw/react-native-google-ad-manager.git", :tag => "#{s.version}" }
  s.swift_version = "4.0"

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  # We can't add the Google-Mobile-Ads-SDK as a dependency, as it would prevent
  # this library to be used with `use_frameworks!`.
  # So instead we add the default location of the framework to the framework
  # search paths, and we rely on consumers of this library to add
  # Google-Mobile-Ads-SDK as a direct dependency.
  s.weak_frameworks        = 'GoogleMobileAds'
  s.pod_target_xcconfig    = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Google-Mobile-Ads-SDK/Frameworks/**"',
  }

  s.dependency "React"
end
