import 'package:get/get.dart';
import 'package:rapicredito/model/product_info_bean.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class LoanMoneyDateState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  int configInfoDateDefaultValue = 0;
  String serverTime = '';
  int productId = -1;
  int detailId = -1;

  int orderId = -1;
  String contractName = '';
  String contractUrl = '';
  List<SkillfulFingerFarSide> originList = [];
  List<int> durationList = [];
  bool isManyProduct=false;
  final RxDouble _incrementStep = (0.0).obs;

  double get incrementStep => _incrementStep.value;

  set incrementStep(value) => _incrementStep.value = value;

  final RxString _amountInHand = '--'.obs;

  String get amountInHand => _amountInHand.value;

  set amountInHand(value) => _amountInHand.value = value;


  final RxString _interest = '--'.obs;

  String get interest => _interest.value;

  set interest(value) => _interest.value = value;

  final RxString _serviceCharge = '--'.obs;

  String get serviceCharge => _serviceCharge.value;

  set serviceCharge(value) => _serviceCharge.value = value;


  final RxString _iva = '--'.obs;

  String get iva => _iva.value;

  set iva(value) => _iva.value = value;

  final RxString _bankServiceCharge = '--'.obs;

  String get bankServiceCharge => _bankServiceCharge.value;

  set bankServiceCharge(value) => _bankServiceCharge.value = value;

  final RxString _repaymentAmount = '--'.obs;

  String get repaymentAmount => _repaymentAmount.value;

  set repaymentAmount(value) => _repaymentAmount.value = value;


  final RxString _repaymentDate = '--'.obs;

  String get repaymentDate => _repaymentDate.value;

  set repaymentDate(value) => _repaymentDate.value = value;

  final RxDouble _applyAmount = 0.0.obs;

  double get applyAmount => _applyAmount.value;

  set applyAmount(value) => _applyAmount.value = value;

  RxList<SelectModel> moneyList = <SelectModel>[].obs;
  final RxInt _moneySelectIndex = 0.obs;

  int get moneySelectIndex => _moneySelectIndex.value;

  set moneySelectIndex(value) => _moneySelectIndex.value = value;

  RxList<SelectModel> dateList = <SelectModel>[].obs;

  final RxInt _dateSelectIndex = (-1).obs;

  int get dateSelectIndex => _dateSelectIndex.value;

  set dateSelectIndex(value) => _dateSelectIndex.value = value;
}
