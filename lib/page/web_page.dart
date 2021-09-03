import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../widget/my_web_view.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com

class WebPage extends StatelessWidget {
  WebPage({Key? key}) : super(key: key);

  late final GlobalKey _webKey = GlobalKey<MyWebViewState>();
  late final WebPageController _controller = Get.put(WebPageController());

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final State? state = _webKey.currentState;
          if (state != null && state is MyWebViewState && await state.canGoBack()) {
            await state.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Material(
          child: Column(
            children: [
              AppBar(
                title: Obx(() => Text(_controller.title.value)),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 2,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () async {
                      final State? state = _webKey.currentState;
                      if (state != null && state is MyWebViewState && await state.canGoBack()) {
                        await state.goBack();
                      } else {
                        Get.back();
                      }
                    }),
              ),
              Flexible(
                child: MyWebView(
                  key: _webKey,
                  initialUrl: Get.parameters["url"] ?? Constant.BASE_PAGE_URL,
                  onTitleChanged: (String? title) {
                    _controller.title.value = title ?? "";
                  },
                ),
              ),
            ],
          ),
        ),
      );
}

class WebPageController extends GetxController {
  final RxString title = "".obs;
}
