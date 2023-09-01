import 'package:get/get.dart';

class AuthPersonState {
  List<String?> incomeList = [];
  List<String?> familyList = [];
  List<String?> educationalList = [];

  ///收入
  final RxString _income = ''.obs;

  String get income => _income.value;

  set income(value) => _income.value = value;

  ///家庭规模
  final RxString _familyCount = ''.obs;

  String get familyCount => _familyCount.value;

  set familyCount(value) => _familyCount.value = value;

  ///教育程度
  final RxString _educationalLevel = ''.obs;

  String get educationalLevel => _educationalLevel.value;

  set educationalLevel(value) => _educationalLevel.value = value;

  final RxBool _btnDisableClick = true.obs;

  bool get btnDisableClick => _btnDisableClick.value;

  set btnDisableClick(value) => _btnDisableClick.value = value;
}
