import 'dart:io';
import 'package:dio/dio.dart';

class NetException {
  static void toastException(dynamic error) async {
    var errorMsg = handleException(error) ?? '默认值';
  }

  static String? handleException(dynamic response) {
    if (response.code != null) {
      return response.errorMessage;
    } else {
      var error = response.errorDio;
      if (error is DioException) {
        var e = error.error;
        if (e is SocketException) {
          return '网络异常';
        }
        if (e is HttpException) {
          return '网络异常';
        } else if (e is FormatException) {
          return '数据格式错误';
        }
        switch (error.type) {
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.connectionTimeout:
            return '连接服务器超时';
          case DioExceptionType.cancel:
            return '连接取消';
          case DioExceptionType.badResponse:
            return '无效请求';
          case DioExceptionType.unknown:
            return '未知错误';
          default:
            return '未知错误';
        }
      }
    }
    return '未知错误默认值';
  }
}
