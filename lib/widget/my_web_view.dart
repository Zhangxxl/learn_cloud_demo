import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yicbridge_aj_app/util/global.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/24 0024
/// [email]    : zhangxx@yunjiacloud.com

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key, required this.initialUrl, this.onTitleChanged})
      : super(key: key);
  final String initialUrl;
  final void Function(String? title)? onTitleChanged;

  @override
  State<StatefulWidget> createState() => MyWebViewState();
}

class MyWebViewState extends State<MyWebView> with AutomaticKeepAliveClientMixin{
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebView(
      initialUrl: widget.initialUrl,
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: !kReleaseMode,
      javascriptChannels: {
        JavascriptChannel(name: 'jsChannel', onMessageReceived: jsChannel)
      },
      onWebViewCreated: (WebViewController controller) {
        this.controller = controller;
      },
      onPageFinished: (url) async =>
          widget.onTitleChanged?.call(await controller?.getTitle()));
  }

  void jsChannel(JavascriptMessage message) {
    logger.i("jsChannel: ${message.message}");
  }

  Future<bool> canGoBack() async => await controller?.canGoBack() ?? false;

  Future<void> goBack() async => await controller?.goBack();

  @override
  bool get wantKeepAlive => true;
}
