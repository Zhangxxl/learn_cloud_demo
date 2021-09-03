import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_color.dart';
import '../router/routes.dart';
import '../util/global.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/24 0024
/// [email]    : zhangxx@yunjiacloud.com

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key, required this.initialUrl, this.onTitleChanged}) : super(key: key);

  final String initialUrl;
  final void Function(String? title)? onTitleChanged;

  @override
  State<StatefulWidget> createState() => MyWebViewState();
}

class MyWebViewState extends State<MyWebView> with AutomaticKeepAliveClientMixin {
  MyWebViewState();

  late InAppWebViewController webViewController;
  late PullToRefreshController pullToRefreshController = PullToRefreshController(
    options: PullToRefreshOptions(color: MyColor.blue),
    onRefresh: () async {
      if (GetPlatform.isAndroid) {
        webViewController.reload();
      } else if (GetPlatform.isIOS) {
        webViewController.loadUrl(urlRequest: URLRequest(url: await webViewController.getUrl()));
      }
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InAppWebView(
        pullToRefreshController: pullToRefreshController,
        initialUrlRequest: URLRequest(url: Uri.parse(widget.initialUrl)),
        initialUserScripts: UnmodifiableListView<UserScript>([
          UserScript(source: "window.yicbridge=window.flutter_inappwebview;", injectionTime: UserScriptInjectionTime.AT_DOCUMENT_END),
        ]),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              supportZoom: true,
              useOnLoadResource: true,
              useShouldInterceptAjaxRequest: true,
              useShouldInterceptFetchRequest: true,
              useShouldOverrideUrlLoading: true,
              applicationNameForUserAgent: "",
              javaScriptCanOpenWindowsAutomatically: true,
              javaScriptEnabled: true,
              allowFileAccessFromFileURLs: true,
              allowUniversalAccessFromFileURLs: true,
              preferredContentMode: UserPreferredContentMode.MOBILE,
              cacheEnabled: !kReleaseMode),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
            supportMultipleWindows: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
            sharedCookiesEnabled: true,
            enableViewportScale: true,
            allowsAirPlayForMediaPlayback: true,
            allowsPictureInPictureMediaPlayback: true,
            isFraudulentWebsiteWarningEnabled: true,
            suppressesIncrementalRendering: true,
            selectionGranularity: IOSWKSelectionGranularity.DYNAMIC,
            ignoresViewportScaleLimits: true,
            limitsNavigationsToAppBoundDomains: true,
          ),
        ),
        shouldOverrideUrlLoading: shouldOverrideUrlLoading,
        onCreateWindow: (InAppWebViewController controller, CreateWindowAction createWindowAction) async {
          final url = createWindowAction.request.url?.toString();
          logger.i("onCreateWindow: $url");
          if (url != null) {
            Get.toNamed(Routes.PAGE_WEB, parameters: {"url": url});
          } else if (GetPlatform.isAndroid) {
            final headlessInAppWebView = HeadlessInAppWebView(windowId: createWindowAction.windowId);
            headlessInAppWebView.onLoadStart = (headlessController, url) {
              if (url != null) {
                Get.toNamed(Routes.PAGE_WEB, parameters: {"url": url.toString()});
              }
              headlessInAppWebView.dispose();
            };
            headlessInAppWebView.run();
          }
          return true;
        },
        onLoadStart: (controller, url) {
          logger.i("WebView onLoadStart: $url");
        },
        onConsoleMessage: (controller, message) {
          logger.i("WebView Console: \n$message");
        },
        onLoadStop: (controller, url) async {
          logger.i("WebView onLoadStop: $url");
          if (await pullToRefreshController.isRefreshing()) {
            logger.i("isRefreshing");
            await pullToRefreshController.endRefreshing();
          }
        },
        onLoadError: (controller, uri, code, msg) async {
          if (await pullToRefreshController.isRefreshing()) {
            logger.i("isRefreshing");
            await pullToRefreshController.endRefreshing();
          }
        },
        onProgressChanged: (controller, progress) async {
          if (progress == 100) {
            if (await pullToRefreshController.isRefreshing()) {
              pullToRefreshController.endRefreshing();
            }
            // final String to = token.replaceAll("SESSION=", "");
            // await controller.evaluateJavascript(source: 'window.getSession("")');
          }
        },
        onTitleChanged: (InAppWebViewController controller, String? title) {
          logger.i("onTitleChanged: $title");
          if (widget.onTitleChanged != null) {
            widget.onTitleChanged!(title);
          }
        },
        onWebViewCreated: (InAppWebViewController controller) async {
          webViewController = controller;
          controller.addJavaScriptHandler(handlerName: "getUser", callback: (List<dynamic>? arguments) => {});
          controller.addJavaScriptHandler(
              handlerName: "logout",
              callback: (List<dynamic>? arguments) {
                controller.clearCache();
                logout();
              });
          controller.addJavaScriptHandler(
              handlerName: "open",
              callback: (List<dynamic>? arguments) {
                if (arguments != null && arguments.isNotEmpty && arguments[0] is String) {
                  Get.toNamed(Routes.PAGE_WEB, parameters: {"url": arguments[0] as String});
                  return true;
                } else {
                  return false;
                }
              });
          controller.addJavaScriptHandler(
            handlerName: "getToken",
            callback: (List<dynamic>? arguments) => {},
          );
        });
  }

  Future<NavigationActionPolicy> shouldOverrideUrlLoading(InAppWebViewController controller, NavigationAction navigationAction) async {
    final url = navigationAction.request.url?.toString();
    if (url == null) {
      return NavigationActionPolicy.CANCEL;
    } else if (url.startsWith(RegExp("https?://"))) {
      return NavigationActionPolicy.ALLOW;
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      }
      return NavigationActionPolicy.CANCEL;
    }
  }

  Future<bool> canGoBack() => webViewController.canGoBack();

  Future<void> goBack() => webViewController.goBack();
}
