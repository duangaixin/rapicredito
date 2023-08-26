import 'package:get/get.dart';

class LoginState {
  int totalSecond = 60;
  final RxInt _timeEnd = 60.obs;

  int get timeEnd => _timeEnd.value;

  set timeEnd(value) => _timeEnd.value = value;

  final RxBool _isInitClick = true.obs;

  bool get isInitClick => _isInitClick.value;

  set isInitClick(value) => _isInitClick.value = value;


  final RxBool _btnDisableClick = true.obs;

  bool get btnDisableClick => _btnDisableClick.value;

  set btnDisableClick(value) => _btnDisableClick.value = value;

}
