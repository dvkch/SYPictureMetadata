Pod::Spec.new do |s|
  s.ios.deployment_target  = '10.0'
  s.tvos.deployment_target = '10.0'
  s.macos.deployment_target = '10.13'
  s.name     = 'SYPictureMetadata'
  s.version  = '2.0.1'
  s.license  = 'Custom'
  s.summary  = 'Easy access to EXIF metadata of an image'
  s.homepage = 'https://github.com/dvkch/SYPictureMetadata'
  s.author   = { 'Stan Chevallier' => 'contact@stanislaschevallier.fr' }
  s.source   = { :git => 'https://github.com/dvkch/SYPictureMetadata.git', :tag => s.version.to_s }
  s.source_files = 'SYPictureMetadata/*.{h,m,swift}'
  s.requires_arc = true
  s.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }
  s.frameworks = 'ImageIO', 'Photos', 'CoreGraphics'
  s.module_name = "SYPictureMetadata"
  s.swift_version = '5.0'
end
