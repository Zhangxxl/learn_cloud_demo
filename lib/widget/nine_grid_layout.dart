import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../router/routes.dart';
import '../util/ext/list_ext.dart';
import 'getx_widget.dart';

class NineGridView extends StatelessWidget {
  const NineGridView(this.urls, {Key? key, this.space = 0}) : super(key: key);

  final List<String> urls;
  final double space;

  @override
  Widget build(BuildContext context) => NineGridLayout(
        children: urls
            .mapWithPosition(
                (position, item) => buildImage(context, position, item))
            .toList(),
        space: space,
      );

  Widget buildImage(BuildContext context, int position, String url) =>
      TouchImage(
        url,
        touchColor: Colors.black38,
        fit: urls.length == 1 ? BoxFit.contain : BoxFit.cover,
        click: () {
          Get.toNamed(Routes.PAGE_PHOTO, arguments: {
            'photos': urls,
            'index': position,
          });
        },
      );
}

class TouchImage extends GetxWidget<_TouchImageController> {
  TouchImage(this.url,
      {Key? key,
      this.touchColor = Colors.transparent,
      this.fit = BoxFit.contain,
      this.click})
      : super(_TouchImageController(), key: key);

  final String url;
  final Color touchColor;
  final BoxFit fit;
  final void Function()? click;

  @override
  Widget build(BuildContext context) => Obx(
        () => Container(
          foregroundDecoration: BoxDecoration(color: controller._color()),
          child: GestureDetector(
            onTap: click,
            onTapUp: (d) {
              controller._color(Colors.transparent);
            },
            onTapCancel: () {
              controller._color(Colors.transparent);
            },
            onTapDown: (d) {
              controller._color(touchColor);
            },
            child: Hero(
              tag: url,
              child: ExtendedImage.network(url, fit: fit),
            ),
          ),
        ),
      );
}

class _TouchImageController extends GetxController {
  final Rx<Color> _color = Colors.transparent.obs;
}

class NineGridLayout extends MultiChildRenderObjectWidget {
  NineGridLayout({Key? key, List<Widget> children = const [], this.space = 0})
      : super(key: key, children: children);

  final double space;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderNineGridLayout(space: space);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderNineGridLayout renderObject) {
    renderObject.space = space;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<double>('space', space));
  }
}

class RenderNineGridLayout extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, NineGridLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, NineGridLayoutParentData>,
        DebugOverflowIndicatorMixin {
  RenderNineGridLayout({List<RenderBox>? children, double space = 0}) {
    _space = space;
    addAll(children);
  }

  double _space = 0;

  set space(double space) {
    assert(space > 0);
    if (_space == space) {
      return;
    }
    _space = space;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! NineGridLayoutParentData)
      child.parentData = NineGridLayoutParentData();
  }

  @override
  void performLayout() {
    final double maxWidth = constraints.maxWidth;
    final double appositeWidth = checkWidth(maxWidth);
    final double appositeHeight = checkHeight(maxWidth);
    final double childSize = appositeWidth / 3;
    double realChildSize = childSize;
    switch (childCount) {
      case 0:
        size = Size(constraints.minWidth, constraints.minHeight);
        return;
      case 1:
        firstChild!.layout(
            BoxConstraints.loose(Size(childSize * 2, childSize * 2)),
            parentUsesSize: true);
        final double singleChildWidth =
            checkWidth(min(childSize * 2, firstChild!.size.width));
        size = Size(singleChildWidth, firstChild!.size.height);
        return;
      case 2:
        realChildSize = (childSize * 2 - _space) / 2;
        size = Size(checkWidth(childSize * 2), checkHeight(realChildSize));
        break;
      case 3:
        realChildSize = (childSize * 3 - _space * 2) / 3;
        size = Size(checkWidth(maxWidth), checkHeight(realChildSize));
        break;
      case 4:
      case 5:
      case 6:
        realChildSize = (childSize * 3 - _space * 2) / 3;
        size = Size(appositeWidth, checkHeight(realChildSize * 2 + _space));
        break;
      case 7:
      case 8:
      case 9:
      default:
        realChildSize = (childSize * 3 - _space * 2) / 3;
        size = Size(appositeWidth, appositeHeight);
    }
    RenderBox? child = firstChild;
    int childIndex = 0;
    while (child != null) {
      child.layout(
          BoxConstraints.expand(width: realChildSize, height: realChildSize),
          parentUsesSize: true);
      final NineGridLayoutParentData? childParentData =
          child.parentData as NineGridLayoutParentData?;
      childParentData?.offset = Offset(
          childIndex % 3 * realChildSize + childIndex % 3 * _space,
          childIndex ~/ 3 * realChildSize + childIndex ~/ 3 * _space);
      child = childParentData?.nextSibling;
      childIndex++;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result,
          {@required required Offset position}) =>
      defaultHitTestChildren(result, position: position);

  double checkWidth(double targetWidth) {
    if (targetWidth > constraints.maxWidth)
      return constraints.maxWidth;
    else if (targetWidth < constraints.minWidth)
      return constraints.minWidth;
    else
      return targetWidth;
  }

  double checkHeight(double targetHeight) {
    if (targetHeight > constraints.maxHeight)
      return constraints.maxHeight;
    else if (targetHeight < constraints.minHeight)
      return constraints.minHeight;
    else
      return targetHeight;
  }
}

class NineGridLayoutParentData extends ContainerBoxParentData<RenderBox> {}
