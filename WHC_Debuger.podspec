Pod::Spec.new do |s|

s.name         = "WHC_Debuger"
s.version      = "1.0.2"
s.summary      = "iOS Debuger超方便开发辅助调试器"

s.homepage     = "https://github.com/netyouli/WHC_Debuger"

s.license      = "MIT"

s.author             = { "吴海超(WHC)" => "712641411@qq.com" }

s.platform     = :ios
s.platform     = :ios, "6.0"

s.source       = { :git => "https://github.com/netyouli/WHC_Debuger.git", :tag => "1.0.2"}

s.source_files  = "WHC_Debuger/WHC_Debuger/*.{h,m}"

# s.public_header_files = "Classes/**/*.h"
s.requires_arc = true


end
