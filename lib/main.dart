import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:yicbridge_aj_app/constant.dart';

import 'app.dart';
import 'util/global.dart';

Future<void> main() async {
  // sp = await SharedPreferences.getInstance();
  await GetStorage.init();
  storeage = GetStorage();
  if (kDebugMode && GetPlatform.isAndroid && !GetPlatform.isWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  if (GetPlatform.isAndroid && !GetPlatform.isWeb) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
  }
  LeanCloud.initialize(Constant.LEAN_APP_ID, Constant.LEAN_APP_KEY, queryCache: LCQueryCache());
  runApp(MyApp());
}