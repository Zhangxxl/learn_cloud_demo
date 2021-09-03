import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class GetxWidget<T extends GetxController> extends StatelessWidget {

  GetxWidget(T controller, {Key? key}) : super(key: key) {
    this.controller = Get.put(controller);
  }
  late final T controller;

  @override
  Widget build(BuildContext context);
}
