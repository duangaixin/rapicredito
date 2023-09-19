import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rapicredito/model/home_product_info_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class MainHomeState {
  GlobalKey payTwoKey = GlobalKey();
  int orderId = -1;
  bool isRefresh = false;

  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  RxList<HomeProductInfoBean> originNetList = <HomeProductInfoBean>[].obs;
  RxList<HomeProductInfoBean> otherOrderList = <HomeProductInfoBean>[].obs;
  RxList<HomeProductInfoBean> notPlaceOrderList = <HomeProductInfoBean>[].obs;
  RxList<HomeProductInfoBean> dataSource = <HomeProductInfoBean>[].obs;

  ///借款金额
  final RxDouble _creditAmount = 0.0.obs;

  double get creditAmount => _creditAmount.value;

  set creditAmount(status) => _creditAmount.value = status;

  final RxString _applyDate = ''.obs;

  String get applyDate => _applyDate.value;

  set applyDate(value) => _applyDate.value = value;

  ///还款金额
  final RxDouble _repaymentAmount = 0.0.obs;

  double get repaymentAmount => _repaymentAmount.value;

  set repaymentAmount(status) => _repaymentAmount.value = status;

  ///还款日期

  final RxString _repaymentDate = ''.obs;

  String get repaymentDate => _repaymentDate.value;

  set repaymentDate(value) => _repaymentDate.value = value;

  ///是否支持展期支付

  final RxBool _canRolloverPay = false.obs;

  bool get canRolloverPay => _canRolloverPay.value;

  set canRolloverPay(value) => _canRolloverPay.value = value;

  ///展示支付按钮时间

  final RxInt _rolloverPayDay = 0.obs;

  int get rolloverPayDay => _rolloverPayDay.value;

  set rolloverPayDay(status) => _rolloverPayDay.value = status;

  ///更新到期日

  final RxString _updateDueDate = ''.obs;

  String get updateDueDate => _updateDueDate.value;

  set updateDueDate(value) => _updateDueDate.value = value;

  ///展期-延期费用

  final RxDouble _deferralCharge = 0.0.obs;

  double get deferralCharge => _deferralCharge.value;

  set deferralCharge(status) => _deferralCharge.value = status;

  ///利息
  final RxDouble _interest = 0.0.obs;

  double get interest => _interest.value;

  set interest(status) => _interest.value = status;

  ///滞纳金
  final RxDouble _overduePayment = 0.0.obs;

  double get overduePayment => _overduePayment.value;

  set overduePayment(status) => _overduePayment.value = status;

  ///增值税

  final RxDouble _valueAddedTax = 0.0.obs;

  double get valueAddedTax => _valueAddedTax.value;

  set valueAddedTax(status) => _valueAddedTax.value = status;

  ///扣除成本

  final RxDouble _deductCost = 0.0.obs;

  double get deductCost => _deductCost.value;

  set deductCost(status) => _deductCost.value = status;

  ///支付费用

  final RxDouble _payFee = 0.0.obs;

  double get payFee => _payFee.value;

  set payFee(status) => _payFee.value = status;

  ///逾期天数
  final RxInt _overdueDay = 0.obs;

  int get overdueDay => _overdueDay.value;

  set overdueDay(status) => _overdueDay.value = status;

  final RxBool _onePayShow = true.obs;

  bool get onePayShow => _onePayShow.value;

  set onePayShow(value) => _onePayShow.value = value;

  final RxBool _twoPayShow = true.obs;

  bool get twoPayShow => _twoPayShow.value;

  set twoPayShow(value) => _twoPayShow.value = value;

  final RxBool _threePayShow = false.obs;

  bool get threePayShow => _threePayShow.value;

  set threePayShow(value) => _threePayShow.value = value;

  final RxBool _fourPayShow = false.obs;

  bool get fourPayShow => _fourPayShow.value;

  set fourPayShow(value) => _fourPayShow.value = value;

  final RxBool _fivePayShow = false.obs;

  bool get fivePayShow => _fivePayShow.value;

  set fivePayShow(value) => _fivePayShow.value = value;

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
