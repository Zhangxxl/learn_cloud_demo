// ignore_for_file: unused_field, constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../constant.dart';
import '../util/global.dart';
import 'http_intercept.dart';
import 'my_log_interceptor.dart';

typedef JsonMap = Map<String, dynamic>;

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/22 0022
/// [email]    : zhangxx@yunjiacloud.com
abstract class HttpApi {
  HttpApi._();
  static const int CONNECT_TIMEOUT = 35 * 1000;
  static const int RECEIVE_TIMEOUT = 35 * 1000;
  static const int SEND_TIMEOUT = 15 * 1000;

  static late final Dio _dio = _initDio();
  static late final _formOptions = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      sendTimeout: SEND_TIMEOUT,
      contentType: Headers.formUrlEncodedContentType,
      baseUrl: Constant.BASE_URL);

  static late final _jsonOptions = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      sendTimeout: SEND_TIMEOUT,
      contentType: Headers.jsonContentType,
      baseUrl: Constant.BASE_URL);

  static late final _formRequestOption = Options(contentType: Headers.formUrlEncodedContentType);
  static late final _jsonRequestOption = Options(contentType: Headers.jsonContentType);

  static Dio _initDio() {
    final dio = Dio(_jsonOptions);
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //   // config the http client
    //   client.findProxy = (uri) {
    //     //proxy all request to localhost:8888
    //     return "PROXY 192.168.99.98:8888"; //这里将localhost设置为自己电脑的IP，其他不变，注意上线的时候一定记得把代理去掉
    //   };
    //   // you can also create a HttpClient to dio
    //   // return HttpClient();
    // };
    dio.interceptors
      ..add(HttpIntercept())
      ..add(
          MyLogInterceptor(requestBody: true, responseBody: true, requestBodyFormat: _formatRequest, responseBodyFormat: _formatResponse));
    return dio;
  }

  static String _formatResponse(Response resp) {
    if (resp.data == null) {
      return "";
    }
    switch (resp.requestOptions.responseType) {
      case ResponseType.json:
        return formatJson(resp.data);
      case ResponseType.plain:
        return resp.data.toString();
      default:
        return "不支持的responseBody";
    }
  }

  static String _formatRequest(dynamic req) => formatJson(req);

  static String formatJson(dynamic data) => tryRun(() => const JsonEncoder.withIndent('  ').convert(data), defaultValue: data.toString())!;

  static Future<T?> request<T>(
    String url, {
    JsonMap? params,
    Options? options,
    String method = "POST",
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    method = method.toUpperCase();
    final hasBody = ["POST", "PUT", "PATCH"].contains(method);
    options = DioMixin.checkOptions(method, options);
    final Response<T?>? resp = await tryRunAsync(
      () => _dio.request<T?>(
        url,
        data: hasBody ? params : null,
        queryParameters: hasBody ? null : params,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
    return resp?.data;
  }

  static bool isSuccess(JsonMap? resp) =>
      resp != null &&
      resp["errorCode"] != null &&
      ((resp["errorCode"] is num && resp["errorCode"] as num == 200) || int.tryParse(resp["errorCode"].toString()) == 200);

  static Future<JsonMap?> modifyPassword(num id, String oldPassWord, String newPassword) {
    final params = {"id": id, "oldPassWord": oldPassWord, "newPassword": newPassword, "confirmPassword": newPassword};
    return request("api/safety/password/updatePassword", params: params);
  }

  static Future<dynamic> logout() => request("api/logout/out", method: "GET");

  static Future<bool?> querySystem(String parentMenuIds) async {
    final JsonMap? resp = await request("/api/common/queryMenuByParentId", params: {"parentMenuIds": parentMenuIds}, method: "GET");
    final dynamic data = resp?["data"];
    return data == null ? null : data is List && data.isNotEmpty;
  }

  static Future<File?> down(String url, File file, ProgressCallback? onReceiveProgress) async {
    final Response<dynamic> data = await _dio.download(url, file.path,
        options: Options(responseType: ResponseType.bytes, followRedirects: false), onReceiveProgress: onReceiveProgress);
    return data.statusCode == 200 ? file : null;
  }
}
