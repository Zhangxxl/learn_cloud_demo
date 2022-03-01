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
class TabWeb extends StatelessWidget {
  const TabWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MyWebView(initialUrl: Constant.BASE_PAGE_URL);
}
