import 'package:get/get.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/model/key_value_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class AccountState {
  List<String> accountTypeList = ['Billetera Móvil', 'Cuenta Bancaria'];
  bool isAddAccount = true;
  String collectionTypeCode = '';
  bool isFirstEnter = false;
  List<ConfigInfoBean> originAccountList = [];
  List<ConfigInfoBean> originBankNameList = [];
  List<ConfigInfoBean> originBankTypeList = [];

  RxList<KeyValueBean> walletList = <KeyValueBean>[].obs;
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;
  final RxInt _walletSelectIndex = 0.obs;

  int get walletSelectIndex => _walletSelectIndex.value;

  set walletSelectIndex(value) => _walletSelectIndex.value = value;

  final RxInt _accountTypeSelectIndex = 0.obs;

  int get accountTypeSelectIndex => _accountTypeSelectIndex.value;

  set accountTypeSelectIndex(value) => _accountTypeSelectIndex.value = value;

  ///银行名称
  final RxString _bankName = ''.obs;

  String get bankName => _bankName.value;

  set bankName(value) => _bankName.value = value;

  ///银行类型
  final RxString _bankType = ''.obs;

  String get bankType => _bankType.value;

  set bankType(value) => _bankType.value = value;

  final RxBool _walletBtnDisableClick = true.obs;

  bool get walletBtnDisableClick => _walletBtnDisableClick.value;

  set walletBtnDisableClick(value) => _walletBtnDisableClick.value = value;

  final RxBool _bankBtnDisableClick = true.obs;

  bool get bankBtnDisableClick => _bankBtnDisableClick.value;

  set bankBtnDisableClick(value) => _bankBtnDisableClick.value = value;
}
