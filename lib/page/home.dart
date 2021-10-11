import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/mine.dart';
import '../component/notice.dart';
import '../component/web_frame.dart';
import '../generated/assets.gen.dart';
import '../generated/l10n.dart';

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

  late final _titles = [S.current.notice, S.current.work_station, S.current.mine];
  final _pageController = PageController();
  late final controller = Get.put(HomeController()..title.value = _titles[0]);

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
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: ImageIcon(Assets.resources.image.icNotication), label: _titles[0]),
              BottomNavigationBarItem(icon: ImageIcon(Assets.resources.image.icWork), label: _titles[1]),
              BottomNavigationBarItem(icon: ImageIcon(Assets.resources.image.icMine), label: _titles[2]),
            ],
          ),
        ),
      );

  Future<void> _onItemTapped(int value) async {
    await _pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    controller.title.value = _titles[value];
    controller.currentIndex.value = value;
  }
}

class HomeController extends GetxController {
  final title = RxString("");
  final currentIndex = 0.obs;
  final subSystem = Get.parameters["subSystem"] ?? "";
}
