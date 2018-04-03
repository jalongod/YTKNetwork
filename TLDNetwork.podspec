Pod::Spec.new do |s|

  s.name         = "TLDNetwork"
  s.version      = "0.1.0"
  s.summary      = "特来电 网络请求模块"
  s.homepage     = "https://www.teld.cn"
  s.license      = "MIT"
  s.author       = {
                    "zcr" => "zhangcr@teld.cn",
 }
  s.source        = { :git => "http://tfs.teld.cn:8080/tfs/teld/APP/_git/IOS_TLDNetwork", :tag => s.version.to_s }
  s.source_files  = "YTKNetwork/*.{h,m}"
  s.requires_arc  = true

  s.private_header_files = "YTKNetwork/YTKNetworkPrivate.h"

  s.ios.deployment_target = "7.0"
  s.framework = "CFNetwork"

  s.dependency "AFNetworking", "~> 3.0"
  s.dependency "TLDEncrytor", "~> 0.1.0"
end
