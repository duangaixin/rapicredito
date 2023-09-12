import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rapicredito/get/getx_extension.dart';
import 'package:rapicredito/net/base_response.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class NetException {
  static void dealAllException(dynamic error) async {
    // var errorMsg = handleException(error) ?? 'Galat tak diketahui';
    // ProgressHUD.showError(errorMsg);
    dealException(error);
  }

  static void showNoNetDialog() {
    Get.showNoNetDialog();
  }

  static void dealException(dynamic response) {
    if (response is BaseResponse) {
      if (response.code != null) {
        ProgressHUD.showError(response.message ?? '');
      } else {
        var error = response.errorDio;
        if (error is DioException) {
          var e = error.error;
          if (e is SocketException) {
            showNoNetDialog();
            return;
          } else if (e is HttpException) {
            showNoNetDialog();
            return;
          } else if (e is FormatException) {
            ProgressHUD.showError('Pengecualian dalam format data');
          }
        } else {
          ProgressHUD.showError('unknow error');
        }
      }
    }
  }

// static String? handleException(dynamic response) {
//   if (response is BaseResponse) {
//     if (response.code != null) {
//       return response.message;
//     } else {
//       var error = response.errorDio;
//       if (error is DioException) {
//         var e = error.error;
//         if (e is SocketException) {
//           return 'Kelainan jaringan';
//         }
//         if (e is HttpException) {
//           return 'Kelainan jaringan';
//         } else if (e is FormatException) {
//           return 'Pengecualian dalam format data';
//         }
//         switch (error.type) {
//           case DioExceptionType.sendTimeout:
//           case DioExceptionType.receiveTimeout:
//           case DioExceptionType.connectionTimeout:
//             return 'Waktu koneksi habis';
//           case DioExceptionType.cancel:
//             return 'Koneksi dibatalkan';
//           case DioExceptionType.badResponse:
//             return 'Permintaan tidak valid';
//           case DioExceptionType.unknown:
//             return 'Galat tak diketahui';
//           default:
//             return 'Galat tak diketahui';
//         }
//       }
//     }
//   }
//   return 'Galat tak diketahui';
// }
}
