WHC_Debuger
==============
![Build Status](https://api.travis-ci.org/netyouli/WHC_Debuger.svg?branch=master)
[![Pod Version](http://img.shields.io/cocoapods/v/WHC_Debuger.svg?style=flat)](http://cocoadocs.org/docsets/WHC_Debuger/)
[![Pod Platform](http://img.shields.io/cocoapods/p/WHC_Debuger.svg?style=flat)](http://cocoadocs.org/docsets/WHC_Debuger/)
[![Pod License](http://img.shields.io/cocoapods/l/WHC_Debuger.svg?style=flat)](https://opensource.org/licenses/MIT)
简介
==============
- **便捷**: 在维护未知项目调试定位当前界面VCClass文件超方便
- **安全**: 该库文件代码只在Debug模式参入编译,Release发版将不会编译该库代码
- **强大**: 在非主线程操作UI能给出危险警告弹窗让开发者检查改正代码
- **咨询**: 712641411
- **作者**: 吴海超

[关于WHC_Debuger详细介绍](https://gold.xitu.io/post/587b2a89b123db005dee10a3)</br>

使用第三方库
==============
* Github：[AutoLayoutKit](https://github.com/netyouli/WHC_AutoLayoutKit)</br>

演示
==============
<img src = "https://github.com/netyouli/WHC_Debuger/blob/master/WHC_Debuger.gif">

要求
==============
* iOS 6.0 or later
* Xcode 8.0 or later

集成
==============
* 使用CocoaPods:
  -  OC版 pod 'WHC_Debuger', '~> 1.0.2'
  -  Swift版 pod 'WHC_DebugerSwift', '~> 1.0.0'
* 手工集成:
  -  OC导入文件夹WHC_Debuger
  -  Swift导入文件夹WHC_DebugerSwift 

用法
==============
只需要项目引入（手工/CocoaPods）WHC_Debuger相关文件即可无需任何代码配置

推荐
==============
- json/xml 转Class mac工具：https://github.com/netyouli/WHC_DataModelFactory
- 超好用模型sqlite库：https://github.com/netyouli/WHC_ModelSqliteKit
- 轻量级键盘管理器：https://github.com/netyouli/WHC_KeyboardManager
- 扫描项目没有使用图片工具：https://github.com/netyouli/WHC_ScanUnreferenceImageTool

## <a id="期待"></a>期待

- 如果您在使用过程中有任何问题，欢迎issue me! 很乐意为您解答任何相关问题!
- 与其给我点star，不如向我狠狠地抛来一个BUG！
- 如果您想要更多的接口来自定义或者建议/意见，欢迎issue me！我会根据大家的需求提供更多的接口！

## Licenses
All source code is licensed under the MIT License.
