# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'
use_frameworks!

target 'VideoRecorder' do
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for VideoRecorder
pod 'FirebaseAuth'
pod 'FirebaseFirestore'

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end

end
