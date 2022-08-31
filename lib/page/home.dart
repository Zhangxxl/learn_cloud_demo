import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';
import 'package:yicbridge_aj_app/component/tab_moments_posts.dart';

import '../component/tab_message.dart';
import '../component/tab_mine.dart';
import '../component/tab_web.dart';
import '../generated/assets.gen.dart';
import '../generated/l10n.dart';
import '../util/global.dart';
import '../util/global_controller.dart';
import '../util/im_message_utils.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/21 0021
/// [email]    : zhangxx@yunjiacloud.com
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key) {
    final globalController = Get.find<GlobalController>();
    Client? client = globalController.client.value;
    if (client == null) {
      client = Client(id: globalController.user.value!.mobile!);
      globalController.client.value = client;
    }
    client.onOpened = IMMessageUtils.instance.onOpened;
    client.onResuming = IMMessageUtils.instance.onResuming;
    client.onDisconnected = IMMessageUtils.instance.onDisconnected;
    client.onClosed = IMMessageUtils.instance.onClosed;
    client.onInvited = IMMessageUtils.instance.onInvited;
    client.onKicked = IMMessageUtils.instance.onKicked;
    client.onMembersJoined = IMMessageUtils.instance.onMembersJoined;
    client.onMembersLeft = IMMessageUtils.instance.onMembersLeft;
    client.onBlocked = IMMessageUtils.instance.onBlocked;
    client.onUnblocked = IMMessageUtils.instance.onUnblocked;
    client.onMembersBlocked = IMMessageUtils.instance.onMembersBlocked;
    client.onMembersUnBlocked = IMMessageUtils.instance.onMembersUnBlocked;
    client.onMuted = IMMessageUtils.instance.onMuted;
    client.onUnmuted = IMMessageUtils.instance.onUnmuted;
    client.onMembersMuted = IMMessageUtils.instance.onMembersMuted;
    client.onMembersUnMuted = IMMessageUtils.instance.onMembersUnMuted;
    client.onInfoUpdated = IMMessageUtils.instance.onInfoUpdated;
    client.onUnreadMessageCountUpdated = IMMessageUtils.instance.onUnreadMessageCountUpdated;
    client.onLastReadAtUpdated = IMMessageUtils.instance.onLastReadAtUpdated;
    client.onLastDeliveredAtUpdated = IMMessageUtils.instance.onLastDeliveredAtUpdated;
    client.onMessage = IMMessageUtils.instance.onMessage;
    client.open(reconnect: true);
  }

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
                  children: const [TabMessage(), TabMomentsPosts(), TabWeb(), TabMine()],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            unselectedFontSize: 14,
            currentIndex: controller.currentIndex.value,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Assets.resources.image.icNotice.image(), label: S.current.message),
              BottomNavigationBarItem(icon: Assets.resources.image.icNotice.image(), label: S.current.moments_posts),
              BottomNavigationBarItem(icon: Assets.resources.image.icWork.image(), label: S.current.work_station),
              BottomNavigationBarItem(icon: Assets.resources.image.icMine.image(), label: S.current.mine),
            ],
          ),
        ),
      );

  Future<void> _onItemTapped(int value) async {
    logger.i('_onItemTapped: $value');
    await _pageController.animateToPage(value,
        duration: Duration(milliseconds: 100 * (value - controller.currentIndex.value).abs()), curve: Curves.ease);
    // final _titles = [S.current.message, S.current.moments_posts, S.current.work_station, S.current.mine];
    // controller.title.value = _titles[value];
    controller.currentIndex.value = value;
  }
}

class HomeController extends GetxController {
  // late final title = S.current.message.obs;
  final currentIndex = 0.obs;
}
