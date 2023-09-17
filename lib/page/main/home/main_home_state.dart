import 'package:flutter/cupertino.dart';
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
  GlobalKey payTwoKey = GlobalKey();
  int orderId = -1;

  ///借款金额
  double creditAmount = 0.0;
  String applyDate = '';

  ///还款金额
  double repaymentAmount = 0.0;

  ///还款日期
  String repaymentDate = '';

  ///是否支持展期支付
  bool canRolloverPay = false;

  ///展示支付按钮时间
  int rolloverPayDay = 0;

  ///更新到期日
  String updateDueDate = '';

  ///展期-延期费用
  double deferralCharge = 0.0;

  ///利息
  double interest = 0.0;

  ///滞纳金
  double overduePayment = 0.0;

  ///增值税
  double valueAddedTax = 0.0;

  ///扣除成本
  double deductCost = 0.0;

  ///支付费用
  double payFee = 0.0;

  ///逾期时间
  int overdueDay = 0;

  bool onePayShow = true;
  bool twoPayShow = true;
  bool threePayShow = true;
  bool fourPayShow = true;
  bool fivePayShow = true;

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
