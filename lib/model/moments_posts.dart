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
  static const COLUMN_CREATE_USER = "createUser";
  static const COLUMN_IMAGES = "imgs";
  static const COLUMN_COMMENTS = "comments";

  int get id => this[COLUMN_ID];

  String get content => this[COLUMN_CONTENT];

  set content(String? value) => this[COLUMN_CONTENT] = value;

  LCUser get createUser => this[COLUMN_CREATE_USER];

  set createUser(LCUser value) => this[COLUMN_CREATE_USER] = value;

  List<LCFile> get imgs => (this[COLUMN_IMAGES] as List).cast<LCFile>();

  set imgs(List<LCFile> value) => this[COLUMN_IMAGES] = value;

  List<MomentsPostsComment> get comments =>
      (this[COLUMN_COMMENTS] as List).cast<MomentsPostsComment>();

  set comments(List<MomentsPostsComment> value) =>
      this[COLUMN_COMMENTS] = value;
}

class MomentsPostsComment extends DataObject {
  MomentsPostsComment.empty() : super(COLUMN_CLASS_NAME);

  static const COLUMN_CLASS_NAME = "moments_posts_comment";
  static const COLUMN_ID = "id";
  static const COLUMN_CONTENT = "content";
  static const COLUMN_FROM_USER = "fromUser";
  static const COLUMN_TO_USER = "toUser";

  int get id => this[COLUMN_ID];

  String get content => this[COLUMN_CONTENT];

  set content(String? value) => this[COLUMN_CONTENT] = value;

  LCUser? get fromUser => this[COLUMN_FROM_USER];

  set fromUser(LCUser? value) => this[COLUMN_FROM_USER] = value;

  LCUser? get toUser => this[COLUMN_TO_USER];

  set toUser(LCUser? value) => this[COLUMN_TO_USER] = value;
}
