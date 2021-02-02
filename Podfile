inhibit_all_warnings!

target :'SYPictureMetadataExample' do
	platform :ios, '10.0'
	pod 'SYPictureMetadata', :path => "./", :inhibit_warnings => false
	pod 'SYKit'
end

target :'SYPictureMetadataTests' do
	platform :ios, '10.0'
	pod 'SYPictureMetadata', :path => "./", :inhibit_warnings => false
	pod 'SYKit'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        end
    end
end
