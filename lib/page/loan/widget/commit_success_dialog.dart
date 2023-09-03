import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/router/page_router_name.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class CommitSuccessDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommitSuccessDialogState();

  const CommitSuccessDialog({
    Key? key,
  }) : super(key: key);
}

class _CommitSuccessDialogState extends State<CommitSuccessDialog> {
  int totalSecond = 5;
  int timeEnd = 5;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: 340.0,
        margin: const EdgeInsets.only(top: 150.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: _buildDialog()), _buildCancelView()],
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      height: 279.0,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomImageView(
            Resource.assetsImageCommitSuccessDialog,
            imageType: ImageType.assets,
            width: 85.0,
            height: 72.0,
            margin: EdgeInsets.only(top: 34, bottom: 17.0),
          ),
          const Text(
            'Su solicitud de préstamo ha sido ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 28.0),
            child: Text(
              'enviada con éxito',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Color(0xff666666)),
            ),
          ),
          CustomButton(
            onPressed: () {
              Get.back();
              goToMainPage();
            },
            minWidth: 152.0,
            minHeight: 46.0,
            backgroundColor: Colors.white,
            disabledBackgroundColor: Colors.white,
            fontSize: 15.0,
            radius: 8.0,
            text: 'OK',
            textColor: const Color(0xff333333),
            fontWeight: FontWeight.bold,
            side: const BorderSide(color: Color(0xff333333), width: 1.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${timeEnd}s',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14.0, color: Color(0xff666666)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelView() {
    return CustomClickView(
        onTap: () {
          Get.back();
          goToMainPage();
        },
        child: Container(
          height: 54.0,
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 18.0),
          child: Container(
            alignment: Alignment.center,
            width: 36.0,
            height: 36.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const Text(
              'X',
              style: TextStyle(color: Color(0xff111111), fontSize: 16.0),
            ),
          ),
        ));
  }

  void _startTimer() {
    timeEnd = 5;
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
        .take(totalSecond)
        .listen((int i) {
      timeEnd = totalSecond - i - 1;
      if (mounted) {
        setState(() {});
      }
      if (timeEnd <= 0) {
        Get.back();
        goToMainPage();
      }
    });
  }

  void goToMainPage() {
    Get.until((route) =>
        (route as GetPageRoute).routeName == PageRouterName.mainPage);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
