import 'package:get/get.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';
import 'package:leancloud_storage/leancloud.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/22 0022
/// [email]    : zhangxx@yunjiacloud.com
class GlobalController extends GetxController {
  final Rx<LCUser?> user = Rx(null);
  final Rx<Client?> client = Rx(null);
}