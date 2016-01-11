Pod::Spec.new do |s|
  s.name             = "DLVersion"
  s.version          = "0.3.2"
  s.summary          = "Utilities for working with app verisons"
  s.homepage         = "https://github.com/detroit-labs/DLVersion"
  s.license          = 'MIT'
  s.author           = { "Nate West" => "nwest@detroitlabs.com" }
  s.source           = { :git => "https://github.com/detroit-labs/DLVersion.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/detroitlabs'

  s.requires_arc = true

  s.ios.deployment_target = "6.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "10.9"

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
end
