import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com
class TabMessage extends StatefulWidget {
  const TabMessage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabMessageState();
}

class _TabMessageState extends State<TabMessage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text('$index'),
        onTap: () {
          EasyLoading.showInfo('$index');
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
