Pod::Spec.new do |s|
  s.ios.deployment_target  = '7.0'
  s.tvos.deployment_target = '9.0'
  s.name     = 'SYPictureMetadata'
  s.version  = '1.3.1'
  s.license  = 'Custom'
  s.summary  = 'Easy access to EXIF metadata of an image'
  s.homepage = 'https://github.com/dvkch/SYPictureMetadata'
  s.author   = { 'Stan Chevallier' => 'contact@stanislaschevallier.fr' }
  s.source   = { :git => 'https://github.com/dvkch/SYPictureMetadata.git', :tag => s.version.to_s }
  s.source_files = 'SYPictureMetadata/*.{h,m}'
  s.requires_arc = true
  s.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }
  s.dependency "Mantle"
end
