import 'package:get/get.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/2/23 0023
///[email]    : zhangxx@yunjiacloud.com
class IMController extends GetxController {
  late final Rx<MessageObs?> message = Rx<MessageObs?>(null);
  late final Rx<List<Conversation>> conversations = Rx<List<Conversation>>([]);
  late final Rx<IMLoginState> loginState = Rx<IMLoginState>(IMLoginState.unLogin);
}

class MessageObs {
  MessageObs(this.client, this.conversation, this.message);

  Client client;
  Conversation conversation;
  Message message;
}

enum IMLoginState {
  // 未登录
  unLogin,
  // 登录中
  logging,
  // 登录成功
  loginSuccess,
  // 登录失败
  loginFail,
  // 网络连接失败
  networkError,
  // 网络重连
  networkReconnect,
}