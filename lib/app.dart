import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'my_color.dart';
import 'router/routes.dart';
import 'theme/themes.dart';
import 'util/global_controller.dart';
import 'util/laguage_utils.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: AppTheme.loadThemeFromLocal().theme,
        darkTheme: AppTheme.darkTheme.theme,
        themeMode: AppTheme.loadThemeModeFromLocal(),
        onGenerateTitle: (context) => S.of(context).appName,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: LanguageUtils.getInstance().getLanguage()?.locale,
        getPages: Routes.pages,
        initialRoute: Routes.PAGE_SPLASH,
        builder: EasyLoading.init(builder: (context, child) {
          init(context);
          return child!;
        }),
        routingCallback: routingCallback,
      );

  void init(BuildContext context) {
    _configRefresh(context);
    _configLoading(context);
  }

  void routingCallback(Routing? value) {
    EasyLoading.dismiss();
  }

  void _configRefresh(BuildContext context) {
    EasyRefresh.defaultHeader = ClassicalHeader(
      refreshedText: S.of(context).refresh_complete,
      infoText: S.of(context).last_refresh_info,
      refreshFailedText: S.of(context).refresh_fail,
      refreshingText: S.of(context).refreshing,
      refreshReadyText: S.of(context).pull_down_to_refresh,
      refreshText: S.of(context).release_to_refresh,
      noMoreText: S.of(context).no_more,
      textColor: MyColor.gray,
      infoColor: MyColor.gray,
      enableHapticFeedback: false,
    );
    EasyRefresh.defaultFooter = ClassicalFooter(
      loadedText: S.of(context).load_complete,
      infoText: S.of(context).last_load_info,
      loadFailedText: S.of(context).load_fail,
      loadReadyText: S.of(context).pull_up_to_load,
      loadingText: S.of(context).loading,
      loadText: S.of(context).release_to_load,
      noMoreText: S.of(context).no_more,
      textColor: MyColor.gray,
      infoColor: MyColor.gray,
      enableHapticFeedback: false,
    );
  }

  void _configLoading(BuildContext context) {
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
