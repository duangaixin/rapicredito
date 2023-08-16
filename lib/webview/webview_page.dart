import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rapicredito/local/app_constants.dart';
import 'package:rapicredito/utils/object_util.dart';
import 'package:rapicredito/widget/base_appbar.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key? key,
  }) : super(key: key);

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  int _progressValue = 0;
  String url = '';
  String title = '';

  @override
  initState() {
    super.initState();
    Map param = Get.arguments;
    if (!ObjectUtil.isEmptyMap(param)) {
      if (param.containsKey(AppConstants.webViewUrlKey)) {
        url = param[AppConstants.webViewUrlKey];
      }
      if (param.containsKey(AppConstants.webViewTitleKey)) {
        title = param[AppConstants.webViewTitleKey];
      }
    }
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (!mounted) {
              return;
            }
            debugPrint('WebView is loading (progress : $progress%)');
            setState(() {
              _progressValue = progress;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool canGoBack = await _controller.canGoBack();
        if (canGoBack) {
          // 网页可以返回时，优先返回上一页
          await _controller.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar:BaseAppBar(
          title: title,
        ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (_progressValue != 100) LinearProgressIndicator(
              value: _progressValue / 100,
              backgroundColor: Colors.transparent,
              minHeight: 2,
            ) else const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

