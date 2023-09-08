import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rapicredito/net/base_response.dart';
import 'package:rapicredito/page/dialog/no_net_dialog.dart';
import 'package:rapicredito/widget/progress_hud_view.dart';

class NetException {
  static void dealAllException(dynamic error) async {
    // var errorMsg = handleException(error) ?? 'Galat tak diketahui';
    // ProgressHUD.showError(errorMsg);
    dealException(error);
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
          } else {
            showNoNetDialog();
            return;
          }
        } else {
          showNoNetDialog();
        }
      }
    } else {
      showNoNetDialog();
    }
  }

  static void showNoNetDialog() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return NoNetDialog(
            clickConfirm: () {
              const intent = AndroidIntent(
                  action: 'android.settings.AIRPLANE_MODE_SETTINGS');
              intent.launch();
            },
          );
        });
  }

  static String? handleException(dynamic response) {
    if (response is BaseResponse) {
      if (response.code != null) {
        return response.message;
      } else {
        var error = response.errorDio;
        if (error is DioException) {
          var e = error.error;
          if (e is SocketException) {
            return 'Kelainan jaringan';
          }
          if (e is HttpException) {
            return 'Kelainan jaringan';
          } else if (e is FormatException) {
            return 'Pengecualian dalam format data';
          }
          switch (error.type) {
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.connectionTimeout:
              return 'Waktu koneksi habis';
            case DioExceptionType.cancel:
              return 'Koneksi dibatalkan';
            case DioExceptionType.badResponse:
              return 'Permintaan tidak valid';
            case DioExceptionType.unknown:
              return 'Galat tak diketahui';
            default:
              return 'Galat tak diketahui';
          }
        }
      }
    }
    return 'Galat tak diketahui';
  }
}
