import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class LoanStatusItemView extends GetView<MainHomeCtr> {
  const LoanStatusItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6.8,
                  height: 6.8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffB8EF17)),
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        '',
                        radius: 8.0,
                        width: 35.8,
                        height: 35.8,
                        margin: EdgeInsets.only(right: 9.0),
                      ),
                      Text(
                        '',
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  CustomColorButton(
                    realClick: null,
                    disableClick: null,
                    disableColors: const [
                      Color(0xffF5F6F4),
                      Color(0xffF5F6F4),
                    ],
                    disable: false,
                    colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
                    height: 46.0,
                    width: 152.0,
                    borderRadius: BorderRadius.circular(8.0),
                    btnContent: Text(
                      '',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: false
                              ? const Color(0xffC4BFBF)
                              : const Color(0xff333333),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          Container(
            height: 1.0,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            color: Color(0xffE8E8E8),
          ),
        ],
      ),
    );
  }
}
