import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rapicredito/utils/log_utils.dart';

class LoggingInterceptor extends Interceptor {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    Log.d('----------Start----------');
    if (options.queryParameters.isEmpty) {
      Log.d('RequestUrl: ${options.baseUrl}${options.path}');
    } else {
      Log.d(
          'RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    Log.d('RequestMethod: ${options.method}');
    Log.d('RequestHeaders:${options.headers}');
    Log.d('RequestContentType: ${options.contentType}');
    Log.d('RequestData: ${options.data.toString()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;

    Log.d('ResponseCode: ${response.statusCode}');
    debugPrint(response.toString());
    Log.d('----------End: $duration ----------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.d('----------Error-----------');
    super.onError(err, handler);
  }
}
