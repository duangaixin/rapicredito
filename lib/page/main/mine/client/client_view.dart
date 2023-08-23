import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/page/main/mine/client/index.dart';
import 'package:rapicredito/widget/custom_page_bg_view.dart';
import 'package:rapicredito/widget/load_container_view.dart';

class ClientPage extends GetView<ClientCtr> {
  const ClientPage({Key? key}) : super(key: key);

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
              child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            shrinkWrap: true,
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItemView(index);
            },
          )),
          const Padding(
            padding: EdgeInsets.only(bottom: 25.0, left: 16.0, right: 16.0),
            child: CommonAgreeView(),
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
