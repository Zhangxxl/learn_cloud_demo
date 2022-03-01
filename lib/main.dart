import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:yicbridge_aj_app/model/moments_posts.dart';

import 'app.dart';
import 'constant.dart';

Future<void> main() async {
  await GetStorage.init();
  if (!kReleaseMode && GetPlatform.isAndroid && !GetPlatform.isWeb) {
    WidgetsFlutterBinding.ensureInitialized();
  }
  if (GetPlatform.isAndroid && !GetPlatform.isWeb) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
  }
  LeanCloud.initialize(Constant.LEAN_APP_ID, Constant.LEAN_APP_KEY,
      /*server: "https://app.zhangxx.cf", */ queryCache: LCQueryCache());
  LCLogger.setLevel(kReleaseMode ? LCLogger.OffLevel : LCLogger.DebugLevel);
  LCObject.registerSubclass<MomentsPosts>(
      MomentsPosts.COLUMN_CLASS_NAME, MomentsPosts.empty);
  runApp(MyApp());
}
