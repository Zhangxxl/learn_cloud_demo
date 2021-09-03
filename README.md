# 智慧住建

基于flutter开发的住建局安监项目移动端

## 架构

* 基于 `flutte2.0`支持 `nullsafety`特性
* 支持 `Android`,`ios`,`web`,`windows`,`macos`,`linux`平台(桌面以及web平台支持不完善)
* 基于`Getx`路由管理,依赖注入以及状态管理
* 基于`dio`处理网络请求
* 基于`json_annotation`处理json序列化和反序列化
* `webview`实现采用`flutter_inappwebview`

## 项目结构

* `component` 业务组件
* `http` Http配置和接口定义
* `item` 列表item组件
* `model` model类
* `page` app中的页面
* `router` 路由相关
* `util` 工具类相关
* `widget` 无业务逻辑的组件
* `app.dart` 全局根组件,以及初始化代码
* `constant.dart` 全局常量定义
* `main.dart` 程序入口
* `my_color.dart` 全局颜色定义

## 依赖

### dependencies:

- [cupertino_icons: ^1.0.3](https://pub.flutter-io.cn/packages/cupertino_icons)
- [get: ^4.3.6](https://pub.flutter-io.cn/packages/get)
- [image_picker: ^0.8.3+2](https://pub.flutter-io.cn/packages/image_picker)
- [shared_preferences: ^2.0.6](https://pub.flutter-io.cn/packages/shared_preferences)
- [url_launcher: ^6.0.9](https://pub.flutter-io.cn/packages/url_launcher)
- [path_provider: ^2.0.2](https://pub.flutter-io.cn/packages/path_provider)
- [device_info_plus: ^2.1.0](https://pub.flutter-io.cn/packages/device_info_plus)
- [date_format: ^2.0.2](https://pub.flutter-io.cn/packages/date_format)
- [flutter_easyloading: ^3.0.0](https://pub.flutter-io.cn/packages/flutter_easyloading)
- [pull_to_refresh: ^2.0.0](https://pub.flutter-io.cn/packages/pull_to_refresh)
- [supercharged: ^2.0.0](https://pub.flutter-io.cn/packages/supercharged)
- [dio: ^4.0.0](https://pub.flutter-io.cn/packages/dio)
- [logger: ^1.0.0](https://pub.flutter-io.cn/packages/logger)
- [json_annotation: ^4.1.0](https://pub.flutter-io.cn/packages/json_annotation)
- [flutter_inappwebview: ^5.3.2](https://pub.flutter-io.cn/packages/flutter_inappwebview)
- [flutter_easyrefresh: ^2.2.1](https://pub.flutter-io.cn/packages/flutter_easyrefresh)
- [package_info_plus: ^1.0.4](https://pub.flutter-io.cn/packages/package_info_plus)
- [install_plugin(master)](https://github.com/Zhangxxl/flutter_install_plugin.git)

### dev_dependencies:

- [json_serializable: ^5.0.0](https://pub.flutter-io.cn/packages/json_serializable)
- [build_runner: ^2.1.1](https://pub.flutter-io.cn/packages/build_runner)
- [flutter_lints: ^1.0.4](https://pub.flutter-io.cn/packages/flutter_lints)