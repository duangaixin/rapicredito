import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeRolloverPaymentResultDialog extends StatefulWidget {
  final String? date;

  const HomeRolloverPaymentResultDialog({Key? key, this.date})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _HomeRolloverPaymentResultDialogState();
}

class _HomeRolloverPaymentResultDialogState
    extends State<HomeRolloverPaymentResultDialog> {
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
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _startTimer() {
    timeEnd = 5;
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
        .take(totalSecond)
        .listen((int i) {
      timeEnd = totalSecond - i - 1;
      if (timeEnd > 0) {
        if (mounted) {
          setState(() {});
        }
      } else {
        var mainHomeCtr = Get.find<MainHomeCtr>();
        mainHomeCtr.requestInitData();
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomImageView(
                Resource.assetsImageResultTip,
                imageType: ImageType.assets,
                width: 103.0,
                height: 87.0,
                margin: EdgeInsets.only(top: 122.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  'Su última fecha de cambio es el  ',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff666666),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.date ?? '',
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff666666),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 44.0, bottom: 4.0),
                child: CustomButton(
                  onPressed: (){
                    var mainHomeCtr = Get.find<MainHomeCtr>();
                    mainHomeCtr.requestInitData();
                    Get.back();
                  },
                  minWidth: 265.0,
                  minHeight: 46.0,
                  backgroundColor: const Color(0xffB8EF17),
                  disabledBackgroundColor: const Color(0xffB8EF17),
                  fontSize: 15.0,
                  radius: 8.0,
                  text: 'OK',
                  textColor: const Color(0xff333333),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$timeEnd s',
                style: const TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff666666),
                    fontFeatures: [FontFeature.tabularFigures()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
