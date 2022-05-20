import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:yicbridge_aj_app/widget/nine_grid_layout.dart';

import '../generated/assets.gen.dart';
import '../generated/l10n.dart';
import '../model/data_object.dart';
import '../model/moments_posts.dart';
import '../model/user.dart';
import '../router/routes.dart';
import '../util/global.dart';

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
    final query = LCQuery<MomentsPosts>(MomentsPosts.COLUMN_CLASS_NAME);
    if (anchor != null) {
      query.whereLessThan(DataObject.COLUMN_CREATED_AT, anchor.createdAt);
    }
    query
        .include(MomentsPosts.COLUMN_IMAGES)
        .include(MomentsPosts.COLUMN_COMMENTS)
        .include(MomentsPosts.COLUMN_CREATE_USER)
        .orderByDescending(DataObject.COLUMN_CREATED_AT)
        .limit(20);
    List<MomentsPosts>? posts;
    try {
      posts = await query.find();
    } catch (e) {
      print(e);
    }
    if (posts != null) {
      logger.i('loadPosts: $posts');
      if (anchor == null) {
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
              itemBuilder: (context, index) =>
                  buildItem(_controller.posts[index]),
            )),
      ),
    );
  }

  Widget buildItem(MomentsPosts post) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildHead(post), buildContent(post), buildImgs(post)],
        ),
      );

  Widget buildContent(MomentsPosts post) => Padding(
        padding: const EdgeInsets.only(left: 70, top: 10, bottom: 10),
        child: Text(post.content),
      );

  @override
  bool get wantKeepAlive => true;

  Widget buildHead(MomentsPosts post) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: (post.createUser.avatar?.url) == null
                ? Image.asset(
                    Assets.resources.image.icMine.path,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  )
                : Image.network(
                    post.createUser.avatar!.url!,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(post.createUser.username ?? post.createUser.mobile!,style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(width: 20),
              Text(post.createdAt?.toString() ?? ""),
            ],
          )
        ],
      );

  Widget buildImgs(MomentsPosts post) =>
      NineGridView(post.imgs.map((e) => e.url!).toList(), space: 10);
}

class MomentsPostsController extends GetxController {
  final RxList<MomentsPosts> posts = <MomentsPosts>[].obs;
}
