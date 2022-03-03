import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Copyright © 2022 yunjia Ltd.
///All rights reserved
///
///[project]  : lean_cloud_test_app
///[package]  :
///[author]   : zhang
///[date]     : 2022/3/2 0002
///[email]    : zhangxx@yunjiacloud.com
class PhotoPage extends StatelessWidget {
  PhotoPage({Key? key}) : super(key: key);

  late final Map<String, dynamic> arguments = Get.arguments;
  late final List<String> photos = arguments["photos"];
  late final int index = arguments["index"];

  late final PhotoPageController _controller =
      PhotoPageController(photos[index].obs);

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Colors.black,
        child: Obx(() => Hero(
              tag: _controller.tag.value,
              child: PageView.builder(
                controller: PageController(initialPage: index),
                itemCount: photos.length,
                onPageChanged: (index) => _controller.tag.value = photos[index],
                itemBuilder: (context, index) =>
                    buildImg(context, photos[index]),
              ),
            )),
      );

  Widget buildImg(BuildContext context, String photo) => GestureDetector(
        onTap: () => Get.back(),
        child: photo.startsWith("http")
            ? Image.network(photo, fit: BoxFit.cover)
            : Image.file(File(photo), fit: BoxFit.cover),
      );
}

class PhotoPageController extends GetxController {
  PhotoPageController(this.tag);

  RxString tag;
}
