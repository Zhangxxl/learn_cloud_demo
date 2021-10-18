// ignore_for_file: constant_identifier_names, non_constant_identifier_names

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/22 0022
/// [email]    : zhangxx@yunjiacloud.com

abstract class Constant {
  Constant._();

  static const BASE_URL = "http://192.168.108.212:50081/";
  // static const BASE_URL = "http://xhzjj.yunjiacloud.com:30081/";
  // static const BASE_PAGE_URL = "http://192.168.98.132/D%3A/HttpServer/test.html";
  static const BASE_PAGE_URL = "http://192.168.108.212:50081/#";
  // static const BASE_PAGE_URL = "http://xhzjj.yunjiacloud.com:30081/#";

  static const SP_KEY_THEME = "sp-key-theme";
  static const SP_KEY_THEME_MODE = "sp-key-theme-mode";
  static const SP_KEY_LANGUAGE = "sp-key-language";
  static const SP_KEY_LANGUAGE_NAME = "sp-key-language-name";

  static late final REGEX_PWD = RegExp(r"^[\w\d]{6,18}$");

  static const LEAN_APP_ID = "FzAM4n1tQVh6pWw0z3L0agda-MdYXbMMI";
  static const LEAN_APP_KEY = "TjgmPz74nB0JNp4lIzMmpaTn";
}
