/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// project  : yicbridge_aj_app
/// package  :
/// author   : zhang
/// date     : 2021/7/6 0023
/// email    : zhangxx@yunjiacloud.com
extension ListExt on List? {
  bool isBlank() => this == null || this!.isEmpty;

  bool isNotBlank() => !isBlank();
}