import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../generated/assets.gen.dart';
import '../generated/l10n.dart';
import '../http/http_api.dart';
import '../model/user.dart';
import '../router/routes.dart';
import '../theme/themes.dart';
import '../util/cache_utils.dart';
import '../util/ext/list_ext.dart';
import '../util/global.dart';
import '../util/global_controller.dart';
import '../util/laguage_utils.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com
class TabMine extends StatefulWidget {
  const TabMine({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabMineState();
}

class _TabMineState extends State<TabMine> with AutomaticKeepAliveClientMixin {
  late final _controller = Get.put(_MineController());
  late final ImagePicker _picker = ImagePicker();
  late final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (GetPlatform.isMobile && !GetPlatform.isWeb) {
      _controller.cacheStr.value = S.current.please_wait;
      CacheUtils.getCacheSize()
          .then((value) => _controller.cacheStr.value = value);
    } else {
      _controller.cacheStr.value = S.current.clean_cache_warning;
    }
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => buildHead(context, globalController.user.value)),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                        globalController.user()?.username ??
                            globalController.user()!.mobile!,
                        style: Theme.of(context).textTheme.headlineMedium)),
                    const SizedBox(height: 10),
                    Obx(() => Text(globalController.user.value?.mobile ?? ""))
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10, width: double.infinity),
        buildItem(
            iconAsset: Assets.resources.image.icModifyPwd.image(width: 16,height: 16),
            text: S.of(context).modify_password,
            click: modifyPassword),
        Obx(() => buildItem(
            iconAsset: Assets.resources.image.icCleanCache.image(width: 16,height: 16),
            text: S.of(context).clean_cache,
            info: _controller.cacheStr.value,
            click: () {
              if (GetPlatform.isWeb || !GetPlatform.isMobile) {
                EasyLoading.showToast(S.of(context).clean_cache_warning);
                return;
              }
              Get.dialog(AlertDialog(
                title: Text(S.of(context).clean_cache),
                content: Text(S.of(context).confirm_clean_cache),
                actions: [
                  TextButton(
                      child: Text(S.of(context).btn_ok),
                      onPressed: () {
                        Get.back();
                      }),
                  TextButton(
                      child: Text(S.of(context).btn_cancel),
                      onPressed: () async {
                        final bool result = await CacheUtils.clearCache();
                        _controller.cacheStr.value = "0.00B";
                        Get.back();
                        EasyLoading.showToast(S.of(context).clean +
                            (result
                                ? S.of(context).info_success
                                : S.of(context).info_fail));
                      }),
                ],
              ));
            })),
        if (GetPlatform.isAndroid)
          buildItem(
            iconAsset: Assets.resources.image.icCheckUpdate.image(width: 16,height: 16),
            text: S.of(context).check_update,
            click: () => checkAppUpdate(),
          ),
        buildItem(
          iconAsset: Assets.resources.image.icAboutMe.image(width: 16,height: 16),
          text: S.of(context).about_us,
          click: () => Get.toNamed(Routes.PAGE_ABOUT_ME),
        ),
        buildItem(
            iconAsset: Assets.resources.image.icAboutMe.image(width: 16,height: 16),
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
                          child: Container(
                              color: e.theme.primaryColor,
                              width: 30,
                              height: 30),
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
            iconAsset: Assets.resources.image.icAboutMe.image(width: 16,height: 16),
            text: S.of(context).theme_mode_setting,
            click: () async {
              final ThemeMode? result = await Get.dialog(
                SimpleDialog(
                    title: Text(S.of(context).theme_setting),
                    children: [
                      SimpleDialogOption(
                          child: Text(S.of(context).theme_mode_default,
                              style: Get.theme.textTheme.button),
                          onPressed: () async {
                            await AppTheme.saveThemeModeFromLocal(
                                ThemeMode.system);
                            Get.back(result: ThemeMode.system);
                          }),
                      SimpleDialogOption(
                          child: Text(S.of(context).theme_mode_dark,
                              style: Get.theme.textTheme.button),
                          onPressed: () async {
                            await AppTheme.saveThemeModeFromLocal(
                                ThemeMode.dark);
                            Get.back(result: ThemeMode.dark);
                          }),
                      SimpleDialogOption(
                          child: Text(S.of(context).theme_mode_light,
                              style: Get.theme.textTheme.button),
                          onPressed: () async {
                            await AppTheme.saveThemeModeFromLocal(
                                ThemeMode.light);
                            Get.back(result: ThemeMode.light);
                          })
                    ]),
              );
              if (result != null) {
                Get.changeThemeMode(result);
              }
              logger.i("result: $result");
            }),
        buildItem(
            iconAsset: Assets.resources.image.icAboutMe.image(width: 16,height: 16),
            text: S.of(context).change_language,
            click: () async {
              final SupportLanguage? selectLanguage =
                  LanguageUtils.getInstance().getLanguage();
              final supportLocale = [
                LanguageUtils.getAutoLocale(context),
                ...await LanguageUtils.getInstance().getSupportLocal()
              ];
              final List<SimpleDialogOption> options = supportLocale.map((e) {
                final Color? color =
                    (selectLanguage != null && selectLanguage.code == e.code)
                        ? context.theme.primaryColor
                        : null;
                final TextStyle style = TextStyle(inherit: true, color: color);
                return SimpleDialogOption(
                    child: Text(e.name, style: style),
                    onPressed: () => Get.back(result: e));
              }).toList();
              final SupportLanguage? result = await Get.dialog(SimpleDialog(
                  title: Text(S.of(context).theme_setting), children: options));
              if (result != null) {
                LanguageUtils.getInstance().setLanguage(result);
              }
            }),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 3, right: 3),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: DecoratedBox(
              decoration: ShapeDecoration(
                color: Get.theme.primaryColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: OutlinedButton(
                onPressed: logout,
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  side: MaterialStateProperty.all(BorderSide.none),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
                ),
                child: Text(S.of(context).login_out_safely,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildItem(
          {required Widget iconAsset,
          required String text,
          required VoidCallback click,
          String? info}) =>
      ColoredBox(
        color: Get.theme.dialogBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 4),
          child: OutlinedButton(
            onPressed: click,
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              side: MaterialStateProperty.all(BorderSide.none),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ImageIcon(iconAsset, size: 16),
                  iconAsset,
                  const SizedBox(width: 12),
                  Text(text, style: Get.theme.textTheme.subtitle1),
                  const Spacer(),
                  if (info != null)
                    Text(info, style: Get.theme.textTheme.bodyText1),
                  Icon(Icons.arrow_forward_ios,
                      size: 18, color: Get.theme.textTheme.bodyText1?.color)
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
      final resp = await HttpApi.down(
          "http://121.40.29.236/home/yicbridge/app/app-product-ha-release.apk",
          file, (count, total) {
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

  Widget buildHead(BuildContext context, LCUser? user) => GestureDetector(
        onTap: selectAvatar,
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Get.theme.primaryColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
            padding: const EdgeInsets.all(2),
            child: ClipOval(
              child: user?.avatar?.url == null
                  ? Icon(Icons.man, size: 72, color: Get.theme.primaryColor)
                  : ExtendedImage.network(user!.avatar!.url!, fit: BoxFit.cover),
            )),
      );

  Future<void> selectAvatar() async {
    final lcUser = globalController.user.value;
    if (lcUser == null) {
      return;
    }
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      EasyLoading.show(status: S.current.loading);
      if (lcUser.avatar != null) {
        await lcUser.avatar!.delete();
      }
      lcUser.avatar = await LCFile.fromPath(image.name, image.path);
      await lcUser.save();
      globalController.user.refresh();
      EasyLoading.showSuccess(S.current.info_success);
    }
  }
}

class _MineController extends GetxController {
  late final RxString cacheStr = RxString("");
}
