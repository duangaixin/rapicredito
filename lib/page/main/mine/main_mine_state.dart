import 'package:get/get.dart';

class MainMineState {
  final RxString _phoneNum = '+57 954-566670'.obs;

  String get phoneNum => _phoneNum.value;

  set phoneNum(value) => _phoneNum.value = value;

  final RxString _userName = 'Ronald Lamb'.obs;

  String get userName => _userName.value;

  set userName(value) => _userName.value = value;

  bool isRefresh = false;
}
