import 'package:get/get.dart';

class MainMineState {
  final RxString _phoneNum = ''.obs;

  String get phoneNum => _phoneNum.value;

  set phoneNum(value) => _phoneNum.value = value;

  final RxString _userName = 'Ronald Lamb'.obs;

  String get userName => _userName.value;

  set userName(value) => _userName.value = value;
  final RxString _userImageUrl = ''.obs;

  String get userImageUrl => _userImageUrl.value;

  set userImageUrl(value) => _userImageUrl.value = value;
  bool isRefresh = false;
}
