import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:rapicredito/net/base_response.dart';
import 'package:rapicredito/net/net_config.dart';
import 'package:rapicredito/net/net_constants.dart';
import 'package:rapicredito/net/pretty_logger_interceptor.dart';
import 'package:http_proxy/http_proxy.dart';


class NetRequest {
  NetRequest._internal();

  final Map<String, Dio?> _mClientMap = {};

  Interceptor _getLoggerInterceptors() => PrettyDioLogger(requestBody: true);

  late NetConfig _netConfig;

  bool get isLoggable => _netConfig.isLoggable();

  NetRequest.init(NetConfig config) {
    _netConfig = config;
  }

  Interceptor _getRequestInterceptors() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        var defHeader = await _netConfig.getDefHeader();
        var defParam = await _netConfig.getDefParam();
        options.headers.addAll(defHeader);
        options.queryParameters.addAll(defParam);
        handler.next(options);
      },
    );
  }

  Dio getDio({String? baseUrl}) {
    var key = baseUrl ?? _netConfig.baseUrl;
    var client = _mClientMap[key];
    if (client == null) {
      client = _createDio(key);
      _mClientMap[key] = client;
    }
    return client;
  }

  Dio _createDio(String baseUrl) {
    var options = _createOptions(baseUrl);
    var dio = Dio(options);
    _setDioInterceptors(dio);
    _setCharlesProxy(dio);
    return dio;
  }

  void _setCharlesProxy(Dio dio) async {
    if(!isLoggable)return;
    HttpProxy httpProxy = await HttpProxy.createHttpProxy();
    var proxyHost = httpProxy.host;
    var proxyPort = httpProxy.port;
    if (proxyHost == null) return;
    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return 'PROXY $proxyHost:$proxyPort;';
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
  }

  void _setDioInterceptors(Dio dio) {
    dio.interceptors.add(_getRequestInterceptors());
    dio.interceptors.addAll(_netConfig.defInterceptors ?? []);
    if (isLoggable) {
      dio.interceptors.add(_getLoggerInterceptors());
    } else {
      dio.interceptors.remove(_getLoggerInterceptors());
    }
  }

  BaseOptions _createOptions(String baseUrl) {
    return BaseOptions(
        connectTimeout:
            const Duration(seconds: NetConstants.defaultConnectTime0ut),
        sendTimeout: const Duration(seconds: NetConstants.defaultSendTime0ut),
        receiveTimeout:
            const Duration(seconds: NetConstants.defaultReceiveTime0ut),
        baseUrl: baseUrl);
  }

  BaseResponse<T> _wrapperData<T>(
    Response result,
    OnTransform<T>? onTransform,
  ) {
    var response = BaseResponse.fromJson(result.data);
    if (response.isSuccess()) {
      T? t;
      var data = response.data;
      if (data != null) {
        t = onTransform != null ? onTransform(data) : data;
      }
      return BaseResponse<T>.success(t, response.code);
    } else {
      var error = BaseResponse<T>.error(response.code, response.errorMessage);
      _netConfig.check401Error(error);
      return error;
    }
  }

  BaseResponse<T> _wrapperError<T>(dynamic e) {
    var error = BaseResponse<T>.errorDio(e);
    _netConfig.check401Error(error);
    return error;
  }

  Future<BaseResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    OnTransform<T>? onTransform,
  }) async {
    try {
      var result = await getDio().get(path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return _wrapperData<T>(result, onTransform);
    }  catch (e) {
      return _wrapperError<T>(e);
    }
  }

  Future<BaseResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    OnTransform<T>? onTransform,
  }) async {
    try {
      var result = await getDio().post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return _wrapperData<T>(result, onTransform);
    }  catch (e) {
      return _wrapperError<T>(e);
    }
  }

  Future<BaseResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    OnTransform<T>? onTransform,
  }) async {
    try {
      var result = await getDio().delete(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return _wrapperData<T>(result, onTransform);
    }  catch (e) {
      return _wrapperError<T>(e);
    }
  }

  Future<BaseResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    OnTransform<T>? onTransform,
  }) async {
    try {
      var result = await getDio().put(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return _wrapperData<T>(result, onTransform);
    }  catch (e) {
      return _wrapperError<T>(e);
    }
  }

  Future<BaseResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    OnTransform<T>? onTransform,
  }) async {
    try {
      var result = await getDio().patch(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return _wrapperData<T>(result, onTransform);
    }  catch (e) {
      return _wrapperError<T>(e);
    }
  }

  Future<BaseResponse<T>> head<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    OnTransform<T>? onTransform,
  }) async {
    try {
      var result = await getDio().head(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return _wrapperData<T>(result, onTransform);
    }  catch (e) {
      return _wrapperError<T>(e);
    }
  }
}
