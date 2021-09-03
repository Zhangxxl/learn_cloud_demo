import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../generated/l10n.dart';
import '../http/http_api.dart';
import '../model/user.dart';
import '../router/routes.dart';
import '../theme/themes.dart';
import '../util/cache_utils.dart';
import '../util/global.dart';
import '../util/global_controller.dart';
import '../util/list_ext.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com
class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineState();
}

class _MineState extends State<Mine> with AutomaticKeepAliveClientMixin {
  late final _controller = Get.put(_MineController());

  @override
  void initState() {
    super.initState();
    if (GetPlatform.isMobile) {
      CacheUtils.getCacheSize().then((value) => _controller.cacheStr.value = value);
    } else {
      _controller.cacheStr.value = "清理缓存仅支持移动平台";
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final globalController = Get.find<GlobalController>();
    return ColoredBox(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Obx(() => getHead(globalController.user.value?.realName ?? "", margin: const EdgeInsets.only(right: 20))),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            globalController.user.value?.nickname ?? "",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(height: 10),
                      Obx(() => Text(globalController.user.value?.mobile ?? ""))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10, width: double.infinity),
          buildItem(iconAsset: "resources/image/ic_modify_pwd.webp", text: "修改密码", click: modifyPassword),
          Obx(() => buildItem(
              iconAsset: "resources/image/ic_clean_cache.webp",
              text: "清除缓存",
              info: _controller.cacheStr.value,
              click: () {
                if (!GetPlatform.isMobile) {
                  EasyLoading.showToast("清理缓存仅支持移动平台");
                  return;
                }
                Get.dialog(AlertDialog(
                  title: const Text("清空缓存"),
                  content: const Text("确认要清空缓存吗?"),
                  actions: [
                    TextButton(
                        child: const Text("取消"),
                        onPressed: () {
                          Get.back();
                        }),
                    TextButton(
                        child: const Text("确定"),
                        onPressed: () async {
                          final bool result = await CacheUtils.clearCache();
                          _controller.cacheStr.value = "0.00B";
                          Get.back();
                          EasyLoading.showToast("清理${result ? "成功" : "失败"}");
                        }),
                  ],
                ));
              })),
          if (GetPlatform.isAndroid)
            buildItem(
              iconAsset: "resources/image/ic_check_update.webp",
              text: "检查更新",
              click: () => checkAppUpdate(),
            ),
          buildItem(iconAsset: "resources/image/ic_about_me.webp", text: "关于我们", click: () => Get.toNamed(Routes.PAGE_ABOUT_ME)),
          buildItem(
              iconAsset: "resources/image/ic_about_me.webp",
              text: S.of(context).theme_setting,
              click: () {
                if (Get.isDarkMode) {
                  EasyLoading.showToast("---");
                  return;
                }
                Get.dialog(
                  SimpleDialog(
                    title: Text(S.of(context).theme_setting),
                    children: AppTheme.allLightTheme
                        .map((e) => SimpleDialogOption(
                            child: Container(color: e.theme.primaryColor, width: 30, height: 30),
                            onPressed: () {
                              Get.changeTheme(e.theme);
                              AppTheme.saveThemeToLocal(e);
                              Get.back();
                            }))
                        .toList(),
                  ),
                );
              }),
          buildItem(
              iconAsset: "resources/image/ic_about_me.webp",
              text: S.of(context).theme_mode_setting,
              click: () {
                Get.dialog(
                  SimpleDialog(title: Text(S.of(context).theme_setting), children: [
                    SimpleDialogOption(
                        child: Text(S.of(context).theme_mode_default, style: Get.theme.textTheme.button),
                        onPressed: () {
                          Get.changeThemeMode(ThemeMode.system);
                          Get.back();
                          AppTheme.saveThemeModeFromLocal(AppTheme.THEME_MODE_SYSTEM);
                        }),
                    SimpleDialogOption(
                        child: Text(S.of(context).theme_mode_dark, style: Get.theme.textTheme.button),
                        onPressed: () {
                          Get.changeThemeMode(ThemeMode.dark);
                          Get.back();
                          AppTheme.saveThemeModeFromLocal(AppTheme.THEME_MODE_DARK);
                        }),
                    SimpleDialogOption(
                        child: Text(S.of(context).theme_mode_light, style: Get.theme.textTheme.button),
                        onPressed: () {
                          Get.changeThemeMode(ThemeMode.light);
                          Get.back();
                          AppTheme.saveThemeModeFromLocal(AppTheme.THEME_MODE_LIGHT);
                        })
                  ]),
                );
              }),
          Container(
            color: Get.theme.shadowColor,
            padding: const EdgeInsets.only(right: 3, left: 3),
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: logout,
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                side: MaterialStateProperty.all(BorderSide.none),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              child: const Text("安全退出", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildItem({required String iconAsset, required String text, required VoidCallback click, String? info}) => ColoredBox(
        color: Get.theme.dialogBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 4),
          child: OutlinedButton(
            onPressed: click,
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              side: MaterialStateProperty.all(BorderSide.none),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage(iconAsset), size: 16),
                  const SizedBox(width: 12),
                  Text(text, style: Get.theme.textTheme.subtitle1),
                  const Spacer(),
                  if (info != null) Text(info, style: Get.theme.textTheme.bodyText1),
                  Icon(Icons.arrow_forward_ios, size: 18, color: Get.theme.textTheme.bodyText1?.color)
                ],
              ),
            ),
          ),
        ),
      );

  Future<void> modifyPassword() async {}

  Future<void> checkAppUpdate() async {
    // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // final String _version = packageInfo.buildNumber;
    // final resp = await HttpApi.checkAppUpdate(_version);
    // if (resp != null) {
    //   // EasyLoading.showToast("版本号${resp.version}");
    //   Get.dialog(AlertDialog(
    //     title: Text("${resp.version}已发布"),
    //     content: Text(resp.content ?? ""),
    //     actions: [
    //       TextButton(child: const Text("下次再说"), onPressed: () => Get.back()),
    //       TextButton(child: const Text("立刻更新"), onPressed: () => downApk("1")),
    //     ],
    //   ));
    // } else {
    //   EasyLoading.showToast("当前已是最新版本");
    // }
  }

  Future<void> downApk(String version) async {
    // Directory? storageDir = await getExternalStorageDirectory();
    Directory? storageDir;
    final List<Directory>? dirs = await getExternalCacheDirectories();
    if (dirs.isNotBlank()) {
      storageDir = dirs![0];
    }
    if (storageDir != null) {
      final String storagePath = storageDir.path;
      final File file = File('$storagePath/智慧安监v$version.apk');
      if (file.existsSync()) {
        file.deleteSync();
      }
      file.createSync();
      final resp = await HttpApi.down("http://121.40.29.236/home/yicbridge/app/app-product-ha-release.apk", file, (count, total) {
        EasyLoading.showProgress(count / total, status: "正在下载...");
      });
      EasyLoading.dismiss();
      if (resp != null && resp.lengthSync() > 0) {
        installApk(file);
      } else {
        EasyLoading.showToast("下载失败");
      }
    } else {
      EasyLoading.showToast("储存空间异常");
    }
  }

  /// 安装apk
  Future<void> installApk(File _apkFile) async {
    final String _apkFilePath = _apkFile.path;
    if (_apkFilePath.isEmpty) {
      logger.i('make sure the apk file is set');
      EasyLoading.showToast("安装包下载错误,请重新下载");
      return;
    }
    final info = await PackageInfo.fromPlatform();
    final String applicationId = info.packageName;
    final result = await InstallPlugin.installApk(_apkFilePath, applicationId);
    logger.i("install result: $result");
  }
}

class _MineController extends GetxController {
  final RxString cacheStr = "请稍后".obs;
}
