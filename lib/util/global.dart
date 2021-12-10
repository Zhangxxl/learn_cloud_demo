import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:logger/logger.dart';

import '../my_color.dart';
import '../router/routes.dart';
import 'global_controller.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com

// late SharedPreferences sp;

late final GetStorage storeage = GetStorage();

late final Logger logger = Logger(
  printer: PrefixPrinter(
    PrettyPrinter(
      lineLength: 200,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  ),
);

Future<void> logout({String? message}) async {
  Get.find<GlobalController>().user.value = null;
  await LCUser.logout();
  Get.offNamed(Routes.PAGE_LOGIN);
}

Future<T?> tryRunAsync<T>(Future<T> Function() fun, {T? defaultValue}) async {
  try {
    return await fun();
  } catch (e) {
    logger.e("========捕获异常========",e);
  }
  return defaultValue;
}

T? tryRun<T>(T Function() fun, {T? defaultValue}) {
  try {
    return fun();
  } catch (e) {
    logger.e("========捕获异常========",e);
  }
  return defaultValue;
}

Widget getHead(String name, {EdgeInsets? margin}) {
  if (name.isNotEmpty && name.length > 2) {
    name = name.substring(name.length - 2);
  }
  return Container(
    width: 60,
    height: 60,
    margin: margin,
    alignment: Alignment.center,
    decoration: const ShapeDecoration(shape: CircleBorder(), color: MyColor.blue),
    child: Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
