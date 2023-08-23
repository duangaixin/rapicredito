import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/loan/first/index.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class FirstLoanPage extends GetView<FirstLoanCtr> {
  const FirstLoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageBgView(
        title: 'Cambiar idioma',
        content: Obx(() {
          return LoadContainerView(
              contentView: contentView, loadState: controller.state.loadState);
        }));
  }

  Widget get contentView => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                  ],

                ),

              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 23.0, left: 55.0, right: 55.0),
            child: CustomButton(
              onPressed: () {},
              minWidth: 265.0,
              minHeight: 46.0,
              backgroundColor: const Color(0xffB8EF17),
              disabledBackgroundColor: const Color(0xffB8EF17),
              fontSize: 15.0,
              radius: 8.0,
              text: 'Aplicar préstamo',
              textColor: const Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );

  Widget _buildItemView(int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ABCDE',
            style: TextStyle(fontSize: 18.0, color: Color(0xff333333)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.0, bottom: 11.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '+123333333333',
                  style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
                ),
                Text(
                  '+223232323323232',
                  style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
                ),
              ],
            ),
          ),
          Text(
            '+1255556677733',
            style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
          ),
          Container(
            height: 1.0,
            color: Color(0xffE9E9E9),
            margin: EdgeInsets.only(top: 24.0, bottom: 19.0),
          )
        ],
      );
}
