import 'package:get/get.dart';

class LoginState {
  int totalSecond = 60;
  final RxInt _timeEnd = 60.obs;

  int get timeEnd => _timeEnd.value;

  set timeEnd(value) => _timeEnd.value = value;

  final RxBool _isInitClick = true.obs;

  bool get isInitClick => _isInitClick.value;

  set isInitClick(value) => _isInitClick.value = value;

  final RxBool _btnLoginDisableClick = true.obs;

  bool get btnLoginDisableClick => _btnLoginDisableClick.value;

  set btnLoginDisableClick(value) => _btnLoginDisableClick.value = value;

  final RxBool _btnOptDisableClick = true.obs;

  bool get btnOptDisableClick => _btnOptDisableClick.value;

  set btnOptDisableClick(value) => _btnOptDisableClick.value = value;
}
