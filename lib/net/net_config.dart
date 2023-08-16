
import 'package:dio/dio.dart';
import 'package:rapicredito/net/base_response.dart';


abstract class INetConfig {
  Future<Map<String, dynamic>> getDefHeader();

  Future<Map<String, dynamic>> getDefParam();

  Interceptors? getDefInterceptors();

  void check401Error(BaseResponse error);
}

typedef OnGetDefHeader = Future<Map<String, dynamic>> Function();
typedef OnGetDefParam = Future<Map<String, dynamic>> Function();
typedef OnGetIsLoggable = bool Function();
typedef OnTransform<T> = T Function(dynamic json);
typedef OnCheck401Error = void Function(BaseResponse error);


class NetConfig implements INetConfig {
  String baseUrl;

  OnGetIsLoggable isLoggable;
  OnGetDefHeader defHeader;
  OnGetDefParam defParam;
  Interceptors? defInterceptors;
  OnCheck401Error onCheck401Error;

  NetConfig(
      {required this.baseUrl,
      required this.isLoggable,
      required this.defHeader,
      required this.defParam,
      required this.onCheck401Error,
      this.defInterceptors});

  @override
  void check401Error(BaseResponse error) {
    onCheck401Error(error);
  }

  @override
  Future<Map<String, dynamic>> getDefHeader() {
    return defHeader();
  }

  @override
  Future<Map<String, dynamic>> getDefParam() {
    return defParam();
  }

  @override
  Interceptors? getDefInterceptors() {
    return defInterceptors;
  }
}
