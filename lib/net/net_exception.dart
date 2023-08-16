import 'dart:io';
import 'package:dio/dio.dart';


class NetException {
  // static void toastException(dynamic error) async {
  //   var s = handleException(error) ?? '默认值';
  // }
  //
  // static String? handleException(dynamic response) {
  //   if (response.code != null) {
  //     return response.errorMessage;
  //   } else {
  //     var error = response.errorDio;
  //     if (error is DioError) {
  //       var e = error.error;
  //       if (e is SocketException) {
  //         return '网络异常';
  //       }
  //       if (e is HttpException) {
  //         return '网络异常';
  //       } else if (e is FormatException) {
  //         return '数据格式错误';
  //       }
  //       switch (error.type) {
  //         case DioErrorType.sendTimeout:
  //         case DioErrorType.receiveTimeout:
  //         case DioErrorType.connectionTimeout:
  //           return '连接服务器超时';
  //         case DioErrorType.cancel:
  //           return '连接取消';
  //         case DioErrorType.badResponse:
  //           return '无效请求';
  //         case DioErrorType.unknown:
  //           return '未知错误';
  //         default:
  //           return '未知错误';
  //       }
  //     }
  //   }
  //   return '未知错误';
  // }
}
