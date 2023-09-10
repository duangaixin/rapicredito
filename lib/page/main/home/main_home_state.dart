import 'package:get/get.dart';
import 'package:rapicredito/model/home_product_info_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class MainHomeState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  bool isRefresh = false;

  List<HomeProductInfoBean> originNetList = [];
  List<HomeProductInfoBean> otherOrderList = [];
  List<HomeProductInfoBean> notPlaceOrderList = [];
  List<HomeProductInfoBean> dataSource = [];
  double creditAmount = 0.0;
  String applyDate = '';

  final RxInt _overdueStatus = (-1).obs;

  int get overdueStatus => _overdueStatus.value;

  set overdueStatus(status) => _overdueStatus.value = status;

  final RxInt _loanStatus = (-1).obs;

  int get loanStatus => _loanStatus.value;

  set loanStatus(status) => _loanStatus.value = status;

  final RxString _maxAmount = '--'.obs;

  String get maxAmount => _maxAmount.value;

  set maxAmount(value) => _maxAmount.value = value;
}
