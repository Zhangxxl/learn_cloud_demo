import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/getx_widget.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/3/2 0002
///[email]    : zhangxx@yunjiacloud.com
class PhotoPage extends GetxWidget<PhotoPageController> {
  PhotoPage({Key? key}) : super(PhotoPageController(), key: key);

  late final Map<String, dynamic> arguments = Get.arguments;
  late final List<String> photos = arguments["photos"];
  late final int index = arguments["index"];

  @override
  Widget build(BuildContext context) => Obx(
        () => ColoredBox(
          color: controller.bgColor(),
          child: PageView.builder(
            controller: PageController(initialPage: index),
            itemCount: photos.length,
            // onPageChanged: (index) => controller.tag.value = photos[index],
            itemBuilder: (context, index) => buildImg(context, photos[index]),
          ),
        ),
      );

  Widget buildImg(BuildContext context, String photo) => GestureDetector(
        onTap: () {
          controller.bgColor.value = Colors.transparent;
          Get.back();
        },
        child: Hero(
            tag: photo,
            child: ExtendedImage.network(
              photo,
              fit: BoxFit.contain,
              enableSlideOutPage: true,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) => GestureConfig(inPageView: true, initialScale: 1.0, cacheGesture: false),
            )),
      );
}

class PhotoPageController extends GetxController {
  Rx<Color> bgColor = Colors.black.obs;
}
