import 'package:get/get.dart';
import 'package:rapicredito/model/home_product_info_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class MainHomeState {
  final _loadState = LoadState.succeed.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  bool isRefresh = false;

  List<HomeProductInfoBean> originNetList = [];
  List<HomeProductInfoBean> otherOrderList = [];
  List<HomeProductInfoBean> notPlaceOrderList = [];
  List<HomeProductInfoBean> dataSource = [];
  final RxString _maxAmount = '10000'.obs;

  String get maxAmount => _maxAmount.value;

  set maxAmount(value) => _maxAmount.value = value;

}
