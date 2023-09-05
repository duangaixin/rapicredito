import 'package:rapicredito/get/getx_storage_service.dart';
import 'package:rapicredito/http/http_request_manage.dart';
import 'package:rapicredito/local/language_store.dart';
import 'package:rapicredito/local/user_store.dart';
import 'package:get/get.dart';

Future<void> initGetInfo() async {
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<LanguageStore>(LanguageStore());
  Get.put<UserStore>(UserStore());
  Get.put<HttpRequestManage>(HttpRequestManage.instance);
}
