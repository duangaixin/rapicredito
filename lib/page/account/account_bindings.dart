import 'package:get/get.dart';
import 'package:rapicredito/page/account/index.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AccountCtr>(AccountCtr());
    //Get.lazyPut<AccountCtr>(() => AccountCtr(), fenix: true);
  }
}
