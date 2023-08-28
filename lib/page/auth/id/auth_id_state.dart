import 'package:get/get.dart';

class AuthIdState {
  double imageWidth = 167.0;

  final RxString _idFrontUrl = ''.obs;

  String get idFrontUrl => _idFrontUrl.value;

  set idFrontUrl(value) => _idFrontUrl.value = value;

  final RxString _idBackUrl = ''.obs;

  String get idBackUrl => _idBackUrl.value;

  set idBackUrl(value) => _idBackUrl.value = value;
}
