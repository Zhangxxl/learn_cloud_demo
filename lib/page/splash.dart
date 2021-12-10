import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leancloud_storage/leancloud.dart';

import '../generated/assets.gen.dart';
import '../router/routes.dart';
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
            child: Assets.resources.image.icSplash.image(),
            widthFactor: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 80),
            child: FractionallySizedBox(
              widthFactor: 0.4,
              child: Assets.resources.image.icSplashWord.image(),
            ),
          )
        ],
      ),
    );
  }

  Future<void> work(DateTime dateTime) async {
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
      nextToPage(route);
    } else {
      Future.delayed(Duration(milliseconds: WAIT_TIME - time), () => nextToPage(route));
    }
  }

  void nextToPage(String route) {
    if (Get.currentRoute == Routes.PAGE_SPLASH) {
      Get.offAllNamed(route);
    }
  }
}
