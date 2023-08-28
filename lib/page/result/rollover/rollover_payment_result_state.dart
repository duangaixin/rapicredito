
import 'package:get/get.dart';

class RolloverPaymentResultState {
  int totalSecond = 5;
  final RxInt _timeEnd = 5.obs;

  int get timeEnd => _timeEnd.value;

  set timeEnd(value) => _timeEnd.value = value;
}


