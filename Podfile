# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Sample Manual' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Sample Manual
  pod 'Kingfisher'
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'SwiftSoup'
  pod 'IGListKit'
  pod 'SVGKit'
  pod 'PKHUD'

  post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
          config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '1'
          config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-O'
          config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
      end
      
      installer.pods_project.targets.each do |target|
        if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
          target.build_configurations.each do |config|
              config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
              config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
          end
        end
        target.build_configurations.each do |config|
          config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        end
      end

   end

end
