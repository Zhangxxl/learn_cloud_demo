import 'package:get/get.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';

import 'im_controller.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/2/23 0023
///[email]    : zhangxx@yunjiacloud.com
class IMMessageUtils {
  IMMessageUtils._();

  static late final IMMessageUtils instance = IMMessageUtils._();

  void onOpened({required Client client}) {}

  void onResuming({required Client client}) {}

  void onDisconnected({required Client client, RTMException? exception}) {}

  void onClosed({required Client client, required RTMException exception}) {}

  void onInvited({required Client client, required Conversation conversation, String? byClientID, DateTime? atDate}) {}

  void onKicked({required Client client, required Conversation conversation, String? byClientID, DateTime? atDate}) {}

  void onMembersJoined({required Client client, required Conversation conversation, List? members, String? byClientID, DateTime? atDate}) {}

  void onMembersLeft({required Client client, required Conversation conversation, List? members, String? byClientID, DateTime? atDate}) {}

  void onBlocked({required Client client, required Conversation conversation, DateTime? atDate, String? byClientID}) {}

  void onUnblocked({
    required Client client,
    required Conversation conversation,
    DateTime? atDate,
    String? byClientID,
  }) {}

  void onMembersBlocked(
      {required Client client, required Conversation conversation, DateTime? atDate, String? byClientID, List<dynamic>? members}) {}

  void onMembersUnBlocked(
      {required Client client, required Conversation conversation, DateTime? atDate, String? byClientID, List? members}) {}

  void onMuted({required Client client, required Conversation conversation, DateTime? atDate, String? byClientID}) {}

  void onUnmuted({required Client client, required Conversation conversation, String? byClientID, DateTime? atDate}) {}

  void onMembersMuted({required Client client, required Conversation conversation, List? members, String? byClientID, DateTime? atDate}) {}

  void onMembersUnMuted(
      {required Client client, required Conversation conversation, List? members, String? byClientID, DateTime? atDate}) {}

  void onInfoUpdated(
      {required Client client,
      required Conversation conversation,
      Map? updatingAttributes,
      Map? updatedAttributes,
      String? byClientID,
      DateTime? atDate}) {}

  void onUnreadMessageCountUpdated({required Client client, required Conversation conversation}) {}

  void onLastReadAtUpdated({required Client client, required Conversation conversation}) {}

  void onLastDeliveredAtUpdated({required Client client, required Conversation conversation}) {}

  void onMessage({required Client client, required Conversation conversation, required Message message}) {
    Get.find<IMController>().message.value = MessageObs(client, conversation, message);
  }

  void onMessageUpdated(
      {required Client client, required Conversation conversation, required Message updatedMessage, int? patchCode, String? patchReason}) {}

  void onMessageRecalled({required Client client, required Conversation conversation, required RecalledMessage recalledMessage}) {}

  void onMessageDelivered(
      {required Client client, required Conversation conversation, String? messageID, String? toClientID, DateTime? atDate}) {}

  void onMessageRead(
      {required Client client, required Conversation conversation, String? messageID, String? byClientID, DateTime? atDate}) {}
}
