import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rapicredito/http/http_api.dart';
import 'package:rapicredito/http/log_interceptor.dart';
import 'package:rapicredito/net/base_response.dart';
import 'package:rapicredito/net/net_config.dart';
import 'package:rapicredito/net/net_request.dart';

late NetRequest httpRequest;

Future<void> initHttp() async {
  httpRequest = NetRequest.init(netConfig);
}

var netConfig = NetConfig(
  baseUrl: HttpApi.apiBaseUrl,
  isLoggable: () => true,
  defHeader: _getDefHeader,
  defParam: _getDefParam,
  onCheck401Error: _check401Error,
  defInterceptors: getNetInterceptors(),
);

bool isReleaseBuild() => !kProfileMode && kReleaseMode;

void _check401Error(BaseResponse<dynamic> error) async {
  if (is401Error(error)) {}
}

bool is401Error(BaseResponse<dynamic> error) {
  if (error.code != null) {
    return true;
  }
  return error.errorDio is DioException &&
      error.errorDio.response?.statusCode == 401;
}

Future<Map<String, dynamic>> _getDefHeader() async {
  var map = <String, dynamic>{};

  return map;
}

Future<Map<String, dynamic>> _getDefParam() async {
  var map = <String, dynamic>{};
  return map;
}

Interceptors? getNetInterceptors() {
  if (!isReleaseBuild()) {
    return Interceptors()..add(LoggingInterceptor());
  }
  return null;
}
