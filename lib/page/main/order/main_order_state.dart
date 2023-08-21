import 'package:get/get.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class MainOrderState {
  final _loadState = LoadState.succeed.obs;

  LoadState get loadState => _loadState.value;

  set loadState(value) => _loadState.value = value;

  bool isRefresh = false;
}
