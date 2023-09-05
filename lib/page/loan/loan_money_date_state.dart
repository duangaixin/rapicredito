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
  List<SkillfulFingerFarSide> originList = [];
  List<int> durationList = [];

  ///到手金额
  String amountInHand = '';

  ///利息
  String interest = '';

  ///服务费
  String serviceCharge = '';

  ///增值税
  String iva = '';

  ///银行收取服务费
  String bankServiceCharge = '';

  ///还款金额
  String repaymentAmount = '';

  ///还款日期
  final RxString _repaymentDate = ''.obs;

  String get repaymentDate => _repaymentDate.value;

  set repaymentDate(value) => _repaymentDate.value = value;
  ///借款金额
  final RxDouble _applyAmount = 0.0.obs;

  double get applyAmount => _applyAmount.value;

  set applyAmount(value) => _applyAmount.value = value;




  RxList<SelectModel> moneyList = <SelectModel>[].obs;
  final RxInt _moneySelectIndex = 0.obs;

  int get moneySelectIndex => _moneySelectIndex.value;

  set moneySelectIndex(value) => _moneySelectIndex.value = value;

  RxList<SelectModel> dateList = <SelectModel>[].obs;

  final RxInt _dateSelectIndex = 0.obs;

  int get dateSelectIndex => _dateSelectIndex.value;

  set dateSelectIndex(value) => _dateSelectIndex.value = value;
}
