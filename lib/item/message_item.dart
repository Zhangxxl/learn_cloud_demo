// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../my_color.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/25 0025
/// [email]    : zhangxx@yunjiacloud.com
class MessageItem<T> extends StatelessWidget {
  const MessageItem(this.type, this.title, this.time, this.subTitle, this.from, this.obj, this.click, {Key? key}) : super(key: key);

  final MessageItemType type;
  final String title;
  final String time;
  final String subTitle;
  final String from;
  final T obj;
  final void Function(T obj) click;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ColoredBox(
            color: MyColor.grayBg,
            child: SizedBox(height: 10, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 2),
            child: OutlinedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                side: MaterialStateProperty.all(BorderSide.none),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              onPressed: () => click(obj),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DecoratedBox(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            color: type == MessageItemType.ITEM_TYPE_MESSAGE ? MyColor.blue.withAlpha(0x33) : MyColor.originBg,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                            child: type == MessageItemType.ITEM_TYPE_MESSAGE
                                ? const Text("系统消息", style: TextStyle(color: MyColor.blue, fontSize: 12))
                                : const Text("我的待办", style: TextStyle(color: MyColor.origin, fontSize: 12)),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          time,
                          style: const TextStyle(color: MyColor.gray, fontSize: 12),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(subTitle),
                          Expanded(child: Text(from, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}

enum MessageItemType { ITEM_TYPE_MESSAGE, ITEM_TYPE_TODO }
