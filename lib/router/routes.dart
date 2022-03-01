// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:yicbridge_aj_app/page/send_posts.dart';

import '../page/about_me.dart';
import '../page/home.dart';
import '../page/login.dart';
import '../page/register.dart';
import '../page/splash.dart';
import '../page/web_page.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
abstract class Routes {
  Routes._();

  static var pages = [
    GetPage(name: PAGE_SPLASH, page: () => const Splash()),
    GetPage(name: PAGE_LOGIN, page: () => Login()),
    GetPage(name: PAGE_HOME, page: () => Home()),
    GetPage(name: PAGE_REGISTER, page: () => Register()),
    GetPage(name: PAGE_WEB, page: () => WebPage()),
    GetPage(name: PAGE_ABOUT_ME, page: () => AboutMe()),
    GetPage(name: PAGE_SEND_POST, page: () => SendPosts()),
  ];

  static const PAGE_SPLASH = "/splash";
  static const PAGE_LOGIN = "/login";
  static const PAGE_REGISTER = "/register";
  static const PAGE_HOME = "/home";
  static const PAGE_WEB = "/web";
  static const PAGE_ABOUT_ME = "/about_me";
  static const PAGE_SEND_POST = "/post/send";
}
