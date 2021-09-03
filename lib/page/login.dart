import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:yicbridge_aj_app/util/global_controller.dart';

import '../generated/l10n.dart';
import '../my_color.dart';
import '../router/routes.dart';
import '../util/string_ext.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final accController = TextEditingController();
  final pwdController = TextEditingController();
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    accController.addListener(inputListener);
    pwdController.addListener(inputListener);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("resources/image/ic_home.webp", width: 126, height: 95),
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
                    onPressed: () => pwdController.clear(),
                    icon: const ImageIcon(
                      AssetImage("resources/image/ic_clean.webp"),
                      size: 14,
                      color: MyColor.gray,
                    ),
                  ),
                ),
                // prefixIcon: Icon()
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: Row(
                children: [
                  TextButton(
                    child: Text(S.of(context).registerAcc),
                    onPressed: () async {
                      final String? acc = await Get.toNamed(Routes.PAGE_REGISTER) as String?;
                      if (acc.isNotBlank()) {
                        accController.text = acc!;
                      }
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).forgetPwd),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Obx(() => ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(S.of(context).login,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(_controller.loginEnable.value ? MyColor.blue : MyColor.gray),
                        shape:
                            MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100)))),
                      ),
                      onPressed: _controller.loginEnable.value ? login : null,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    EasyLoading.show(status: "正在登录...");
    try {
      final LCUser user = await LCUser.login(accController.text, pwdController.text);
      Get.find<GlobalController>().user.value = user;
      Get.offAllNamed(Routes.PAGE_HOME);
    } on LCException catch (e) {
      EasyLoading.showError(e.message ?? S.current.login_fail);
    }
  }

  void inputListener() {
    _controller.loginEnable.value = accController.text.isNotEmpty && pwdController.text.isNotEmpty;
  }
}

class LoginController extends GetxController {
  var loginEnable = false.obs;
}
