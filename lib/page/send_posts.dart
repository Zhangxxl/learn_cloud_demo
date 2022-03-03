import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leancloud_storage/leancloud.dart';

import '../generated/l10n.dart';
import '../model/moments_posts.dart';
import '../theme/themes.dart';
import '../util/global.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/2/25 0025
///[email]    : zhangxx@yunjiacloud.com
class SendPosts extends StatelessWidget {
  SendPosts({Key? key}) : super(key: key);

  late final _textController = TextEditingController();

  late final _controller = Get.put<SendPostsController>(SendPostsController());
  late final ImagePicker _picker = ImagePicker();
  late final _inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.currentTheme.theme.cardColor));

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).post_content),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                await sendPost(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _textController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: S.of(context).please_enter_content,
                  border: _inputBorder,
                  focusedBorder: _inputBorder,
                ),
              ),
              const SizedBox(height: 8),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: [
                      ...makeSelectImg(),
                      if (_controller.showAdd.value)
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () async => selectImg(),
                          ),
                        )
                    ],
                  ))
            ],
          ),
        ),
      );

  Future<void> sendPost(BuildContext context) async {
    if (_textController.text.isEmpty) {
      EasyLoading.showInfo(S.of(context).please_enter_content);
      return;
    }
    EasyLoading.show(status: S.current.loading);
    final momentsPosts = MomentsPosts.empty();
    momentsPosts.content = _textController.text;
    momentsPosts.createUser = await LCUser.getCurrent();
    if (_controller.selectImg.isNotEmpty) {
      final map = _controller.selectImg
          .map((element) async => LCFile.fromPath(element.name, element.path));
      momentsPosts.imgs = await Future.wait(map);
    }
    logger.i(momentsPosts);
    await momentsPosts.save();
    EasyLoading.showSuccess(S.of(context).info_success);
    Get.back(result: momentsPosts);
  }

  List<Widget> makeSelectImg() => _controller.selectImg.map(makeImg).toList();

  Widget makeImg(XFile file) => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            Image.file(File(file.path), fit: BoxFit.cover),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.selectImg.remove(file);
                },
              ),
            ),
          ],
        ),
      );

  Future<void> selectImg() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _controller.selectImg.add(image);
      _controller.showAdd.value = _controller.selectImg.length < 9;
    }
  }
}

class SendPostsController extends GetxController {
  final textController = TextEditingController();
  final selectImg = <XFile>[].obs;
  final showAdd = true.obs;
}
