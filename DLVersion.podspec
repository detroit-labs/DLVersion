Pod::Spec.new do |s|
  s.name             = "DLVersion"
  s.version          = "0.5.0"
  s.summary          = "Utilities for working with app verisons"
  s.homepage         = "https://github.com/detroit-labs/DLVersion"
  s.license          = 'MIT'
  s.author           = { "Vincent Frascello" => "vincent.frascello@detroitlabs.com" }
  s.source           = { :git => "https://github.com/detroit-labs/DLVersion.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/detroitlabs'
  s.swift_versions = ['5.3', '5.4', '5.5']
  s.requires_arc = true
  s.ios.deployment_target = "12.0"
  s.watchos.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "12.0"

  s.source_files = 'Sources/DLVersion/*.swift'
end
