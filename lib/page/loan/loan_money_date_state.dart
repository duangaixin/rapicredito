import 'package:get/get.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class LoanMoneyDateState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  int configInfoDefaultValue = 0;
  int productId = -1;
  int detailId = -1;
  double applyAmount = -1;
  int orderId = -1;

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

  ///借款金额
  String loanAmount = '';

  ///还款金额
  String repaymentAmount = '';

  ///还款日期
  final RxString _repaymentDate = ''.obs;

  String get repaymentDate => _repaymentDate.value;

  set repaymentDate(value) => _repaymentDate.value = value;
}
