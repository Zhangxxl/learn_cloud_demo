/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// project  : yicbridge_aj_app
/// package  :
/// author   : zhang
/// date     : 2021/6/23 0023
/// email    : zhangxx@yunjiacloud.com
extension StringExt on String? {
  bool isBlank() => this == null || this!.trim().isEmpty;

  bool isNotBlank() => !isBlank();
}
