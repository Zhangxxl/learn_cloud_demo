import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../generated/assets.gen.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/29 0029
/// [email]    : zhangxx@yunjiacloud.com

class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);

  late final _AboutMeController _controller = Get.put(_AboutMeController());

  @override
  Widget build(BuildContext context) {
    getVersion();
    return Scaffold(
      appBar: AppBar(
        title: const Text("关于我们"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 65, width: double.infinity),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.resources.image.icSplash.image(width: 55, height: 55),
                const SizedBox(height: 30),
                Obx(() => Text(_controller.appName.value, style: const TextStyle(fontSize: 16))),
                const SizedBox(height: 15),
                Obx(() => Text("版本号: ${_controller.version}(${_controller.buildNum.value})", style: const TextStyle(fontSize: 15))),
              ],
            )
          ],
        ),
      ),
    );
  }

  void getVersion() {
    PackageInfo.fromPlatform().then((info) {
      _controller.version.value = info.version;
      _controller.appName.value = info.appName;
      _controller.buildNum.value = info.buildNumber;
    });
  }
}

class _AboutMeController extends GetxController {
  final version = RxString("");
  final appName = RxString("");
  final buildNum = RxString("");
}
