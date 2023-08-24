import 'package:get/get.dart';
import 'package:rapicredito/model/key_value_bean.dart';

class AddBankState {
  List<String> bankList = ['Billetera Móvil', 'Cuenta Bancaria'];

  final _bankSelectIndex = 0.obs;

  int get bankSelectIndex => _bankSelectIndex.value;

  set bankSelectIndex(value) => _bankSelectIndex.value = value;

  RxList<KeyValueBean> walletList = <KeyValueBean>[
    KeyValueBean(key: 'Cobru', value: ''),
    KeyValueBean(key: 'Powwi', value: ''),
    KeyValueBean(key: 'Powwi', value: ''),
  ].obs;
  final _walletSelectIndex = 0.obs;

  int get walletSelectIndex => _walletSelectIndex.value;

  set walletSelectIndex(value) => _walletSelectIndex.value = value;
}

class KeyValue {
  var title = '';
  var value = '';
}
