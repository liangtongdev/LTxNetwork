Pod::Spec.new do |s|
  s.name         = "LTxNetwork"
  s.version      = "0.0.1"
  s.summary      = "网络访问、文件下载. "
  s.license      = "MIT"
  s.author             = { "liangtong" => "liangtongdev@163.com" }

  s.homepage     = "https://github.com/liangtongdev/LTxNetwork"
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/liangtongdev/LTxNetwork.git", :tag => "#{s.version}", :submodules => true }
  
  s.dependency 'AFNetworking'
  s.dependency 'FMDBExtension'
  s.dependency 'LTxConfig'
  
  s.frameworks = "Foundation", "UIKit"

  #  s.default_subspecs = 'Core'



  # Core
  s.subspec 'Core' do |sp|
    sp.source_files  =  "LTxNetwork/*.{h,m}"
    sp.public_header_files = "LTxNetwork/*.h"
  end

end
