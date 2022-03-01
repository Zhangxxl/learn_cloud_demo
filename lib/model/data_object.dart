import 'package:leancloud_storage/leancloud.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/2/25 0025
///[email]    : zhangxx@yunjiacloud.com
abstract class DataObject<S> extends LCObject {
  DataObject(String className) : super(className);
  static const String COLUMN_OBJECT_ID = "objectId";
  static const String COLUMN_CREATED_AT = "createdAt";
  static const String COLUMN_UPDATED_AT = "updatedAt";

  S initValue(String key , S value) {
    this[key] = value;
    return value;
  }
}
