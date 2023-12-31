import 'package:get/get.dart';
import 'package:rapicredito/model/config_info_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class AuthContactState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;
  bool isFirstEnter = false;
  List<String?> relationshipShowList = [];
  List<ConfigInfoBean> relationshipOriginList = [];

  final RxString _relationshipOne = ''.obs;

  String get relationshipOne => _relationshipOne.value;

  set relationshipOne(value) => _relationshipOne.value = value;

  final RxString _relationshipTwo = ''.obs;

  String get relationshipTwo => _relationshipTwo.value;

  set relationshipTwo(value) => _relationshipTwo.value = value;

  final RxBool _btnDisableClick = true.obs;

  bool get btnDisableClick => _btnDisableClick.value;

  set btnDisableClick(value) => _btnDisableClick.value = value;
}
