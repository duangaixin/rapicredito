import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPersonState {
  String regexNotNull = '[\\s]';
  List<String?> incomeList = [];
  List<String?> familyList = [];
  List<String?> educationalList = [];
  final GlobalKey emailKey = GlobalKey();
  final LayerLink layerLink = LayerLink();

  List<String> emailEndList = [
    '@gmail.com',
    '@hotmail.com',
    '@yahoo.com',
    '@outlook.com',
    '@msn.com'
  ];
  String endEmailStr = '';

  final RxInt _emailSelectIndex = (-1).obs;

  int get emailSelectIndex => _emailSelectIndex.value;

  set emailSelectIndex(value) => _emailSelectIndex.value = value;

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
