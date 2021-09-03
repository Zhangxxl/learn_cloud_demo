import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/mine.dart';
import '../component/notice.dart';
import '../component/web_frame.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  static const _titles = ["通知", "工作台", "我的"];
  final _pageController = PageController();
  late final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: const [Notice(), WebFrame(), Mine()],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            unselectedFontSize: 14,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("resources/image/ic_notication.webp")), label: "通知"),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("resources/image/ic_work.webp")),
                label: "工作台",
              ),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("resources/image/ic_mine.webp")), label: "我的"),
            ],
          ),
        ),
      );

  Future<void> _onItemTapped(int value) async {
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    controller.title.value = Home._titles[value];
    controller.currentIndex.value = value;
  }
}

class HomeController extends GetxController {
  final title = Home._titles[0].obs;
  final currentIndex = 0.obs;
  final subSystem = Get.parameters["subSystem"] ?? "";
}
