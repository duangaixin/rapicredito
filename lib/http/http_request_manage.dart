import 'package:dio/dio.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/http/http_api.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/model/login_info_bean.dart';
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
  Future<BaseResponse<String>> postSendCodeRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<String>(HttpApi.apiSendCode,
        options: Options(headers: {'perfectAche': true}),
        data: param,
        onTransform: (json) => json['littlePenfriendCompressedFlightManager']);
  }

  Future<BaseResponse<LoginInfoBean>> postLoginRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<LoginInfoBean>(HttpApi.apiLogin,
        data: param, onTransform: (json) => LoginInfoBean.fromJson(json));
  }

  Future<BaseResponse<List<ConfigInfoBean>>> postAppConfigInfo(
      Map<String, dynamic> param) async {
    return await httpRequest.post<List<ConfigInfoBean>>(HttpApi.apiConfigInfo,
        data: param,
        onTransform: (json) => json
            .map<ConfigInfoBean>((e) => ConfigInfoBean.fromJson(e))
            .toList());
  }





}
