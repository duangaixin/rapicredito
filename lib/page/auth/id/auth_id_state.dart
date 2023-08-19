
import 'package:get/get.dart';

class AuthIdState {

  ///收入
  final RxString _income = ''.obs;

  String get income => _income.value;

  set income(value) => _income.value = value;

  ///家庭规模
  final RxString _familyCount = ''.obs;

  String get familyCount=> _familyCount.value;

  set familyCount(value) => _familyCount.value = value;

  ///教育程度
  final RxString _educationalLevel= ''.obs;

  String get educationalLevel=> _educationalLevel.value;

  set educationalLevel(value) => _educationalLevel.value = value;

  final RxBool _btnCanClick= true.obs;

  bool get btnCanClick=> _btnCanClick.value;

  set btnCanClick(value) => _btnCanClick.value = value;



}
