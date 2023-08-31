import 'package:dio/dio.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/http/http_api.dart';
import 'package:rapicredito/model/auth_info_bean.dart';
import 'package:rapicredito/model/bank_info_bean.dart';
import 'package:rapicredito/model/client_info_bean.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/model/login_info_bean.dart';
import 'package:rapicredito/model/query_photo_info_bean.dart';
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
        options: Options(headers: {
          'perfectAche': true,
        }, contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => json['littlePenfriendCompressedFlightManager']);
  }

  Future<BaseResponse<LoginInfoBean>> postLoginRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<LoginInfoBean>(HttpApi.apiLogin,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => LoginInfoBean.fromJson(json));
  }

  Future<BaseResponse<List<ConfigInfoBean>>> postAppConfigInfo(
      Map<String, dynamic> param) async {
    return await httpRequest.post<List<ConfigInfoBean>>(HttpApi.apiConfigInfo,
        data: param,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onTransform: (json) => json
            .map<ConfigInfoBean>((e) => ConfigInfoBean.fromJson(e))
            .toList());
  }

  Future<BaseResponse<String>> postUploadPhotoRequest(param) async {
    return await httpRequest.post<String>(HttpApi.apiUploadIdPhoto,
        options: Options(contentType: Headers.multipartFormDataContentType),
        data: param,
        onTransform: (json) => json['northernMarriageCommunism']);
  }

  Future<BaseResponse<QueryPhotoInfoBean>> postQueryPhotoInfo(
      Map<String, dynamic> param) async {
    return await httpRequest.post<QueryPhotoInfoBean>(HttpApi.apiQueryPhoto,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => QueryPhotoInfoBean.fromJson(json));
  }

  Future<BaseResponse> postSaveAuthInfoRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post(HttpApi.apiSaveAuthInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param);
  }

  Future<BaseResponse<AuthInfoBean>> postQueryAuthInfoRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<AuthInfoBean>(HttpApi.apiQueryAuthInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => AuthInfoBean.fromJson(json));
  }

  Future<BaseResponse<ClientInfoBean>> postQueryClientInfoRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<ClientInfoBean>(HttpApi.apiQueryClientInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => ClientInfoBean.fromJson(json));
  }

  Future<BaseResponse<List<BankInfoBean>>> postQueryAccountRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<List<BankInfoBean>>(HttpApi.apiQueryAccountInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) =>
            json.map<BankInfoBean>((e) => BankInfoBean.fromJson(e)).toList());
  }

  Future<BaseResponse> postSaveAccountInfoRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post(HttpApi.apiSaveAccountInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param);
  }








  Future<BaseResponse> postUploadBigJson(
      Map<String, dynamic> param) async {
    return await httpRequest.post(HttpApi.apiUploadBigJson,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => null
    );
  }


  Future<BaseResponse> postQueryUserInfoRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post(HttpApi.apiQueryUserInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => null
    );
  }


}
