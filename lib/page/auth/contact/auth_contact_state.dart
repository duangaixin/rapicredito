import 'package:get/get.dart';

class AuthContactState {
  ///关系1
  final RxString _relationshipOne = ''.obs;

  String get relationshipOne => _relationshipOne.value;

  set relationshipOne(value) => _relationshipOne.value = value;

  ///关系2
  final RxString _relationshipTwo = ''.obs;

  String get relationshipTwo => _relationshipTwo.value;

  set relationshipTwo(value) => _relationshipTwo.value = value;


  final RxBool _btnDisableClick = true.obs;

  bool get btnDisableClick => _btnDisableClick.value;

  set btnDisableClick(value) => _btnDisableClick.value = value;
}
