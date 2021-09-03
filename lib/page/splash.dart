// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yicbridge_aj_app/theme/themes.dart';

import '../router/routes.dart';
import '../util/global.dart';
import '../util/global_controller.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  static const int WAIT_TIME = 1500;

  @override
  Widget build(BuildContext context) {
    work(DateTime.now());

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FractionallySizedBox(
            child: Image.asset("resources/image/ic_splash.webp"),
            widthFactor: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 80),
            child: FractionallySizedBox(
              widthFactor: 0.4,
              child: Image.asset("resources/image/ic_splash_word.webp"),
            ),
          )
        ],
      ),
    );
  }

  Future<void> work(DateTime dateTime) async {
    sp = await SharedPreferences.getInstance();
    final localTheme = AppTheme.loadThemeFromLocal();
    if (Get.theme != localTheme.theme) {
      Get.changeTheme(localTheme.theme);
    }
    final localThemeMode = AppTheme.loadThemeModeFromLocal();
    final int currentThemeMode;
    switch (Get.rootController.themeMode) {
      case ThemeMode.system:
        currentThemeMode = AppTheme.THEME_MODE_SYSTEM;
        break;
      case ThemeMode.dark:
        currentThemeMode = AppTheme.THEME_MODE_DARK;
        break;
      case ThemeMode.light:
        currentThemeMode = AppTheme.THEME_MODE_LIGHT;
        break;
      default:
        currentThemeMode = AppTheme.THEME_MODE_LIGHT;
        break;
    }
    if (currentThemeMode != localThemeMode) {
      switch (localThemeMode) {
        case AppTheme.THEME_MODE_SYSTEM:
          Get.changeThemeMode(ThemeMode.system);
          break;
        case AppTheme.THEME_MODE_DARK:
          Get.changeThemeMode(ThemeMode.dark);
          break;
        case AppTheme.THEME_MODE_LIGHT:
          Get.changeThemeMode(ThemeMode.light);
          break;
      }
      String route;
      final globalController = Get.find<GlobalController>();
      globalController.user.value = await LCUser.getCurrent();
      if (globalController.user.value != null) {
        route = Routes.PAGE_HOME;
      } else {
        route = Routes.PAGE_LOGIN;
      }
      final time = DateTime.now().millisecond - dateTime.millisecond;
      if (time > WAIT_TIME) {
        Get.offAllNamed(route);
      } else {
        Future.delayed(Duration(milliseconds: WAIT_TIME - time), () {
          Get.offAllNamed(route);
        });
      }
    }
  }
}
