import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomImageView(
              Resource.assetsImageNotFound,
              imageType: ImageType.assets,
              width: 142.0,
              height: 100.0,
              margin: EdgeInsets.only(top: 116.0, bottom: 43.0),
            ),
            const Text(
              'ERROR DE RED',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff666666),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 29.0),
              child: CustomButton(
                onPressed: Get.back,
                minWidth: 205.0,
                minHeight: 46.0,
                backgroundColor: Colors.white,
                disabledBackgroundColor: Colors.white,
                fontSize: 15.0,
                radius: 8.0,
                text: 'Actualizar',
                textColor: const Color(0xff333333),
                fontWeight: FontWeight.bold,
                side: const BorderSide(color: Color(0xff333333), width: 1.0),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
