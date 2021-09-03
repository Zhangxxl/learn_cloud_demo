import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:yicbridge_aj_app/theme/themes.dart';

import 'generated/l10n.dart';
import 'my_color.dart';
import 'router/routes.dart';
import 'util/global_controller.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    init();
    return GetMaterialApp(
      title: "测试应用",
      theme: AppTheme.defaultTheme.theme,
      darkTheme: AppTheme.darkTheme.theme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // locale: const Locale.fromSubtags(languageCode: "en"),
      getPages: Routes.pages,
      initialRoute: Routes.PAGE_SPLASH,
      builder: EasyLoading.init(),
      routingCallback: routingCallback,
    );
  }

  void init() {
    Get.put(GlobalController());
    _configRefresh();
    _configLoading();
  }

  void routingCallback(Routing? value) {
    EasyLoading.dismiss();
  }

  void _configRefresh() {
    EasyRefresh.defaultHeader = ClassicalHeader(
      refreshedText: "刷新完成",
      infoText: "上次刷新：%T",
      noMoreText: "没有更多了",
      refreshFailedText: "刷新失败",
      refreshingText: "正在刷新",
      refreshReadyText: "下拉刷新",
      refreshText: "松开刷新",
      textColor: MyColor.gray,
      infoColor: MyColor.gray,
      enableHapticFeedback: false,
    );
    EasyRefresh.defaultFooter = ClassicalFooter(
      loadedText: "加载完成",
      infoText: "上次加载：%T",
      loadFailedText: "加载失败",
      loadReadyText: "上拉加载",
      loadingText: "正在加载",
      loadText: "松开加载",
      noMoreText: "没有更多了",
      textColor: MyColor.gray,
      infoColor: MyColor.gray,
      enableHapticFeedback: false,
    );
  }

  void _configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..maskType = EasyLoadingMaskType.black
      ..loadingStyle = EasyLoadingStyle.dark
      ..contentPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 25)
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
