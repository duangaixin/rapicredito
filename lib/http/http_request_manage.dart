import 'package:dio/dio.dart';
import 'package:rapicredito/config/app_http_init.dart';
import 'package:rapicredito/http/http_api.dart';
import 'package:rapicredito/model/app_setting_info_bean.dart';
import 'package:rapicredito/model/auth_info_bean.dart';
import 'package:rapicredito/model/bank_info_bean.dart';
import 'package:rapicredito/model/client_info_bean.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/model/home_order_info_bean.dart';
import 'package:rapicredito/model/home_product_info_bean.dart';
import 'package:rapicredito/model/login_info_bean.dart';
import 'package:rapicredito/model/order_info_bean.dart';
import 'package:rapicredito/model/pre_submit_order_bean.dart';
import 'package:rapicredito/model/product_info_bean.dart';
import 'package:rapicredito/model/query_photo_info_bean.dart';
import 'package:rapicredito/model/test_calculate_info_bean.dart';
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
  Future<BaseResponse<HomeOrderInfoBean>> postOrderInfo(
      Map<String, dynamic> param) async {
    return await httpRequest.post<HomeOrderInfoBean>(HttpApi.apiOrderInfo,
        data: param,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onTransform:(json) => HomeOrderInfoBean.fromJson(json));
  }

  Future<BaseResponse<AppSettingInfoBean>> postAppSettingInfo(
      Map<String, dynamic> param) async {
    return await httpRequest.post<AppSettingInfoBean>(HttpApi.apiSettingInfo,
        data: param,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onTransform: (json) => AppSettingInfoBean.fromJson(json));
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
    return await httpRequest.post<List<BankInfoBean>>(
        HttpApi.apiQueryAccountInfo,
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

  Future<BaseResponse<List<OrderInfoBean>>> postQueryOrderListRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<List<OrderInfoBean>>(
        HttpApi.apiQueryOrderListInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) =>
            json.map<OrderInfoBean>((e) => OrderInfoBean.fromJson(e)).toList());
  }

  Future<BaseResponse<ProductInfoBean>> postQueryProductInfoRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<ProductInfoBean>(HttpApi.apiQueryProductInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => ProductInfoBean.fromJson(json));
  }

  Future<BaseResponse<TestCalculateInfoBean>> postTestCalculateRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<TestCalculateInfoBean>(
        HttpApi.apiTestCalculateInfo,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => TestCalculateInfoBean.fromJson(json));
  }

  Future<BaseResponse<PreSubmitOrderBean>> postPreSubmitOrderRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<PreSubmitOrderBean>(HttpApi.apiPreSubmitOrder,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => PreSubmitOrderBean.fromJson(json));
  }

  Future<BaseResponse> postSubmitOrderRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post(HttpApi.apiSubmitOrder,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => null);
  }

  Future<BaseResponse<List<HomeProductInfoBean>>> postIsHomeManyProductRequest(
      Map<String, dynamic> param) async {
    return await httpRequest.post<List<HomeProductInfoBean>>(
        HttpApi.apiIsManyProduct,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => json
            .map<HomeProductInfoBean>((e) => HomeProductInfoBean.fromJson(e))
            .toList());
  }

  Future<BaseResponse> postUploadBigJson(dynamic param) async {
    return await httpRequest.post(HttpApi.apiUploadBigJson,
        options: Options(contentType: Headers.jsonContentType),
        data: param,
        onTransform: (json) => null);
  }

  Future<BaseResponse<String>> postIsNeedUploadBigJson(
      Map<String, dynamic> param) async {
    return await httpRequest.post<String>(HttpApi.apiIsNeedUploadBigJson,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: param,
        onTransform: (json) => json['fullMankind']);
  }
}
