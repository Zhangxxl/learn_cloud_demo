import 'package:dio/dio.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/22 0022
/// [email]    : zhangxx@yunjiacloud.com
class HttpIntercept extends Interceptor {

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   super.onRequest(options, handler);
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // if (response.data != null && response.data is Map<String, dynamic>) {
    //   checkToken(response.data);
    // }
    refreshToken(response.headers);
    super.onResponse(response, handler);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  //   EasyLoading.showToast("网络连接错误");
  // }

  // void checkToken(Map<String, dynamic> data) {
  //   final errCode = int.tryParse(data["errorCode"].toString());
  //   if (errCode != null) {
  //     switch (errCode) {
  //       case 200:
  //         break;
  //       case 600:
  //         logout(message:data["errorMessage"]?.toString() ?? "登录状态失效，请重新登陆");
  //         break;
  //       default:
  //         EasyLoading.showToast(data["errorMessage"]?.toString() ?? "网络繁忙，请稍后再试");
  //         break;
  //     }
  //   }
  // }

  void refreshToken(Headers headers) {
    // final cookies = headers["Set-Cookie"];
    // if (cookies != null && cookies.isNotEmpty) {
    //   if (cookies[0].isNotBlank()) {
    //     final cookie = cookies[0].split(";");
    //     if (cookie[0].isNotBlank()) {
    //       logger.i("cookie[0]: ${cookie[0]}");
    //       token = cookie[0];
    //     }
    //   }
    // }
  }
}
