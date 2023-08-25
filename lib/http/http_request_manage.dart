import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/http/http_api.dart';
import 'package:rapicredito/net/base_response.dart';

class HttpRequestManage {
  HttpRequestManage._privateConstructor();

  static final HttpRequestManage _instance =
      HttpRequestManage._privateConstructor();

  static HttpRequestManage get instance {
    return _instance;
  }
}

extension RequestBussiness on HttpRequestManage {
  Future<BaseResponse> postSendCodeRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post(HttpApi.apiSendCode,
        data: param, onTransform: (json) => null);
  }


}
