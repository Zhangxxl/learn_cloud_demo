import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/28 0028
/// [email]    : zhangxx@yunjiacloud.com
class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("resources/image/icon_empty_dynamic.jpg"), const Text("暂时还没有内容哦")],
        ),
      );
}
