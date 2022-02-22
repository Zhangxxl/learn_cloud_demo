import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leancloud_storage/leancloud.dart';

import 'app.dart';
import 'constant.dart';

Future<void> main() async {
  await GetStorage.init();
  if (kDebugMode && GetPlatform.isAndroid && !GetPlatform.isWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  if (GetPlatform.isAndroid && !GetPlatform.isWeb) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
  }
  LeanCloud.initialize(Constant.LEAN_APP_ID, Constant.LEAN_APP_KEY, queryCache: LCQueryCache());
  runApp(MyApp());
}
