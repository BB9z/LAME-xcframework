Pod::Spec.new do |s|
  s.name         = "LAME-xcframework"
  s.version      = "3.100.1"
  s.summary      = "LAME.xcframework supports all Apple platforms."
  s.description  = <<-DESC
    LAME is a high quality MPEG Audio Layer III (MP3) encoder licensed under the LGPL.

    This is a prebuilt xcframework for LAME, supports all Apple platforms.
    DESC
  s.homepage     = "https://github.com/BB9z/LAME-xcframework"
  s.license      = { :type => "LGPL", :file => "LICENSE" }
  s.author       = 'BB9z'
  s.source       = { :http => "https://github.com/BB9z/LAME-xcframework/releases/download/3.100.1/LAME.xcframework.zip", :sha256 => "a071110cf04b0ef44da54092462361270426373341733b2dbcf748a035321c40" }

  s.ios.deployment_target  = '12.0'
  s.osx.deployment_target  = '10.13'
  s.tvos.deployment_target  = '12.0'
  s.watchos.deployment_target  = '4.0'
  s.visionos.deployment_target = '1.0'
  
  s.vendored_frameworks = "LAME.xcframework"
end
