import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com
class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> with AutomaticKeepAliveClientMixin {
  late final _NoticeController _controller = _NoticeController();

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

class _NoticeController extends GetxController {
  final tabIndex = 0.obs;
}
