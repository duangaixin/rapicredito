import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class AuthIdState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;
  List<String?> genderList = [];

  double imageWidth = 167.0;

  final RxString _idFrontUrl = ''.obs;

  String get idFrontUrl => _idFrontUrl.value;

  set idFrontUrl(value) => _idFrontUrl.value = value;

  final RxString _idBackUrl = ''.obs;

  String get idBackUrl => _idBackUrl.value;

  set idBackUrl(value) => _idBackUrl.value = value;

  final RxString _faceUrl = ''.obs;

  String get faceUrl => _faceUrl.value;

  set faceUrl(value) => _faceUrl.value = value;

  final RxString _gender = ''.obs;

  String get gender => _gender.value;

  set gender(value) => _gender.value = value;

  final RxString _birth = ''.obs;

  String get birth => _birth.value;

  set birth(value) => _birth.value = value;

  final RxBool _btnDisableClick = true.obs;

  bool get btnDisableClick => _btnDisableClick.value;

  set btnDisableClick(value) => _btnDisableClick.value = value;
  GlobalKey frontKey = GlobalKey();
  GlobalKey behindKey = GlobalKey();
  GlobalKey faceKey = GlobalKey();

  bool isInitRequest = true;
  bool isUploadFront = false;
  bool isUploadBehind = false;
  bool isUploadFace = false;

  int? birthYear;
  int? birthMonth;
  int? birthDay;
}
