import 'package:get/get.dart';
import 'package:rapicredito/model/client_info_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class ClientState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  List<ClientListBean?> dataSource = [];

  String tip = '';
}

class ClientListBean {
  String? title;
  String? type;
  List<ClientInfoItemBean?> itemList;

  ClientListBean({this.title, this.type, required this.itemList});
}
