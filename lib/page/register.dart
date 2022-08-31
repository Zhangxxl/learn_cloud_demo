import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:leancloud_storage/leancloud.dart';

import '../generated/assets.gen.dart';
import '../generated/l10n.dart';
import '../my_color.dart';

///Copyright © 2021 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2021/8/31 0031
///[email]    : zhangxx@yunjiacloud.com
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final accController = TextEditingController();
  final pwdController = TextEditingController();

  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    accController.addListener(inputListener);
    pwdController.addListener(inputListener);
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).user_register),
          centerTitle: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_outlined), onPressed: () => Get.back()),
          actions: [
            Obx(() => TextButton(child: Text(S.of(context).register), onPressed: _controller.registerEnable.value ? register : null))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 22),
                child: TextField(
                  controller: accController,
                  decoration: InputDecoration(
                    hintText: S.of(context).accHint,
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MyColor.inputBorderColor)),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MyColor.inputBorderColor)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 22),
                child: TextField(
                  controller: pwdController,
                  decoration: InputDecoration(
                    hintText: S.of(context).pwdHint,
                    counterText: "",
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MyColor.inputBorderColor)),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MyColor.inputBorderColor)),
                    suffixIcon: IconButton(
                      icon: Assets.resources.image.icClean.image(width: 14, height: 14, color: MyColor.gray),
                      onPressed: () => pwdController.clear(),
                    ),
                  ),
                  // prefixIcon: Icon()
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 25,
                ),
              )
            ],
          ),
        ));
  }

  void inputListener() {
    _controller.registerEnable.value = accController.text.isNotEmpty && pwdController.text.isNotEmpty;
  }

  Future<void> register() async {
    final LCUser user = LCUser();
    user.username = accController.text;
    user.password = pwdController.text;
    EasyLoading.show(status: S.current.waiting);
    try {
      await user.signUp();
      EasyLoading.showSuccess(S.current.register_success);
      Get.back(result: user.username);
    } on LCException catch (e) {
      if (e.code == 202) {
        EasyLoading.showError(S.current.register_fail_acc);
      } else {
        EasyLoading.showError(S.current.register_fail);
      }
    } on Exception {
      EasyLoading.showError(S.current.networkError);
    }
  }
}

class RegisterController extends GetxController {
  var registerEnable = false.obs;
}
