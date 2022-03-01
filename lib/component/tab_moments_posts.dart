import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:yicbridge_aj_app/model/moments_posts.dart';

import '../generated/l10n.dart';
import '../model/data_object.dart';
import '../router/routes.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com
class TabMomentsPosts extends StatefulWidget {
  const TabMomentsPosts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabMomentsPostsState();
}

class _TabMomentsPostsState extends State<TabMomentsPosts>
    with AutomaticKeepAliveClientMixin {
  late final MomentsPostsController _controller =
      Get.put(MomentsPostsController());

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts([MomentsPosts? anchor]) async {
    final List<MomentsPosts>? posts =
        await LCQuery<MomentsPosts>(MomentsPosts.COLUMN_CLASS_NAME)
            .whereLessThan(DataObject.COLUMN_CREATED_AT,
                anchor?.createdAt ?? DateTime.now())
            .orderByDescending(DataObject.COLUMN_CREATED_AT)
            .limit(20)
            .find();
    if (posts != null) {
      if(anchor == null) {
        _controller.posts.clear();
      }
      _controller.posts.addAll(posts);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).moments_posts),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              final result = await Get.toNamed(Routes.PAGE_SEND_POST);
              if (result != null && result is MomentsPosts) {
                _controller.posts.insert(0, result);
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await loadPosts();
        },
        child: Obx(() => ListView.builder(
              itemCount: _controller.posts.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_controller.posts[index].content),
              ),
            )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MomentsPostsController extends GetxController {
  final RxList<MomentsPosts> posts = <MomentsPosts>[].obs;
}
