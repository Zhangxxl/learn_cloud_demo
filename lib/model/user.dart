import 'package:leancloud_storage/leancloud.dart';

///Copyright © 2021 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  : 
///[author]   : zhang
///[date]     : 2021/8/31 0031
///[email]    : zhangxx@yunjiacloud.com
extension User on LCUser {
  String? get nickname => this['nickname'];

  set nickname(String? value) => this['nickname'] = value;
}