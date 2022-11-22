import 'dart:developer' as developer;
import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/common.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType = Headers.jsonContentType;

    log('============================================================\n');
    log('==============================================onRequest=====\n');
    developer.log(options.baseUrl, name: 'baseUrl');
    developer.log(options.path, name: 'path');
    developer.log(options.headers.toString(), name: 'headers');
    developer.log(options.queryParameters.toString(), name: 'queryParameters');
    developer.log(options.data.toString(), name: 'data');
    log('============================================================\n');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(response.toString(), name: response.requestOptions.path);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    developer.log(err.toString(), name: err.requestOptions.path);

    if (err.response!.statusCode == Common.sessionExpiredStatusCode) {
      showSessionExpiredBottomSheet();
    } else if (err.response!.statusCode == Common.badGatewayStatusCode) {
      showSystemMaintenanceBottomSheet();
    }

    super.onError(err, handler);
  }

  Future showSessionExpiredBottomSheet() async {}

  Future showSystemMaintenanceBottomSheet() async {}
}
