import 'package:leancloud_storage/leancloud.dart';

import 'data_object.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/2/24 0024
///[email]    : zhangxx@yunjiacloud.com
class MomentsPosts extends DataObject {
  MomentsPosts.empty() : super(COLUMN_CLASS_NAME);

  static const COLUMN_CLASS_NAME = "moments_posts";
  static const COLUMN_ID = "id";
  static const COLUMN_CONTENT = "content";
  static const COLUMN_CREATE_USER_ID = "createUserId";
  static const COLUMN_IMAGES = "imgs";

  int get id => this[COLUMN_ID];

  String get content => this[COLUMN_CONTENT];

  set content(String? value) => this[COLUMN_CONTENT] = value;

  String get createUserId => this[COLUMN_CREATE_USER_ID];

  set createUserId(String? value) => this[COLUMN_CREATE_USER_ID] = value;

  List<LCFile> get imgs =>
      this[COLUMN_IMAGES] ?? initValue(COLUMN_IMAGES, <LCFile>[]);

  set imgs(List<LCFile> value) => this[COLUMN_IMAGES] = value;
}
