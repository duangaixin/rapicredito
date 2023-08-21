import 'package:flutter/material.dart';
import 'package:rapicredito/widget/custom_appbar.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'notFound',
        leftAction: () {
          Navigator.pop(context);
        },
      ),
      body: LoadContainerView(
        contentView: Container(),
        loadState: LoadState.failed,
        errorTip: 'NOT FOUND',
      ),
    );
  }
}
