import 'package:get/get.dart';
import 'package:rapicredito/model/key_value_bean.dart';

class AddAccountState {
  List<String> accountTypeList = ['Billetera Móvil', 'Cuenta Bancaria'];

  final _accountTypeSelectIndex = 0.obs;

  int get accountTypeSelectIndex => _accountTypeSelectIndex.value;

  set accountTypeSelectIndex(value) => _accountTypeSelectIndex.value = value;

  RxList<KeyValueBean> walletList = <KeyValueBean>[
    KeyValueBean(key: 'Cobru', value: ''),
    KeyValueBean(key: 'Powwi', value: ''),
    KeyValueBean(key: 'Powwi', value: ''),
  ].obs;
  final _walletSelectIndex = 0.obs;

  int get walletSelectIndex => _walletSelectIndex.value;

  set walletSelectIndex(value) => _walletSelectIndex.value = value;

  ///银行名称
  final RxString _bankName = ''.obs;

  String get bankName => _bankName.value;

  set bankName(value) => _bankName.value = value;

   ///银行名称是否可编辑
  final RxBool _bankNameEnable  = true.obs;

  bool get bankNameEnable => _bankNameEnable.value;

  set bankNameEnable(value) => _bankNameEnable.value = value;

  ///银行类型
  final RxString _bankType = ''.obs;

  String get bankType => _bankType .value;

  set bankType (value) => _bankType .value = value;

  ///银行类型是否可编辑
  final RxBool _bankTypeEnable  = true.obs;

  bool get bankTypeEnable => _bankTypeEnable.value;

  set bankTypeEnable(value) => _bankTypeEnable.value = value;



}



class KeyValue {
  var title = '';
  var value = '';
}
