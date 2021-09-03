import 'package:flutter/material.dart';
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
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> with AutomaticKeepAliveClientMixin {
  late final TabController _tabController = TabController(initialIndex: 0, length: 2, vsync: ScrollableState());
  late final _controller = Get.put(_NoticeController());
  late final titleTextStyle = const TextStyle(fontSize: 15);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      _controller.tabIndex.value = _tabController.index;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Text("");
  }
}

class _NoticeController extends GetxController {
  final tabIndex = 0.obs;
}
