import 'package:get/get.dart';
import 'package:rapicredito/model/client_info_bean.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class ClientState {
  final _loadState = LoadState.loading.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  List<ClientListBean?> dataSource = [];
}

class ClientListBean {
  String? title;
  List<ClientInfoItemBean?> itemList;

  ClientListBean({this.title, required this.itemList});
}
