import 'package:flutter/material.dart';

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
class WebFrame extends StatelessWidget {
  const WebFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final subSystem = Get.find<HomeController>().subSystem;
    return const MyWebView(initialUrl: Constant.BASE_PAGE_URL);
  }
}
