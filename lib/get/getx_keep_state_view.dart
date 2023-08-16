import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class GetKeepStateView<T extends GetxController>
    extends StatefulWidget {
  const GetKeepStateView({Key? key}) : super(key: key);

  final String? tag = null;

  T get ctr => GetInstance().find<T>(tag: tag);

  get updateId => null;

  @protected
  Widget build(BuildContext context);

  @override
  AutoDisposeState createState() => AutoDisposeState<T>();
}

class AutoDisposeState<S extends GetxController> extends State<GetKeepStateView>
    with AutomaticKeepAliveClientMixin<GetKeepStateView> {
  AutoDisposeState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<S>(
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void dispose() {
    Get.delete<S>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
