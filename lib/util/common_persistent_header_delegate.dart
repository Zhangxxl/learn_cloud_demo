import 'package:flutter/material.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/30 0030
/// [email]    : zhangxx@yunjiacloud.com
class CommonPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const CommonPersistentHeaderDelegate({required this.child, required this.height});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
