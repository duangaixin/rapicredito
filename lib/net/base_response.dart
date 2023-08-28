import 'package:rapicredito/net/net_constants.dart';

class BaseResponse<T> {
  int? code;
  String? message;
  T? data;
  dynamic errorDio;

  BaseResponse.success(this.data, this.code);

  BaseResponse.error(this.code, this.message);

  BaseResponse.errorDio(this.errorDio);

  bool isSuccess() => code == NetConstants.codeSuccess;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    var status = json[NetConstants.code];
    code = status is String ? int.tryParse(status) : status;
    message = json[NetConstants.message] ?? '';
    data = json[NetConstants.data];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data[NetConstants.code] = code;
    data[NetConstants.message] = message;
    if (this.data != null) {
      data[NetConstants.data] = this.data;
    }
    return data;
  }
}
