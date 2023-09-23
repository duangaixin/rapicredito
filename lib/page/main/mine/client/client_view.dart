import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/mine/client/index.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
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
            itemCount: controller.state.dataSource.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildListItemView(index);
            },
          )),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 25.0, left: 16.0, right: 16.0),
            child: Text(
              controller.state.tip,
              style: const TextStyle(fontSize: 15.0, color: Color(0xff666666)),
            ),
          )
        ],
      );

  Widget _buildListItemView(int index) {
    var clientInfoBean = controller.state.dataSource[index];
    var title = clientInfoBean?.title ?? '';
    var type = clientInfoBean?.type ?? '';
    var itemList = clientInfoBean?.itemList ?? [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold),
        ),
        GridView.builder(
            padding: const EdgeInsets.only(top: 18.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 11,
                mainAxisSpacing: 11,
                childAspectRatio: Get.size.width / 38),
            itemBuilder: (context, index) {
              var value = itemList[index]?.latestCandle ?? '';
              return _buildGridItemView(index, value, type);
            },
            itemCount: itemList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false),
        Container(
          height: 1.0,
          color: const Color(0xffE9E9E9),
          margin: const EdgeInsets.only(top: 24.0, bottom: 19.0),
        )
      ],
    );
  }

  Widget _buildGridItemView(int index, String value, String type) =>
      CustomClickView(
          onTap: () {
            if (type == '1') {
              controller.callPhone(value);
            } else if (type == '2') {
              controller.jumpWhatsapp(value);
            } else if (type == '3') {
              controller.sendEmail(value);
            }
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              value,
              textAlign: index % 2 == 0 ? TextAlign.left : TextAlign.right,
              style: const TextStyle(fontSize: 15.0, color: Color(0xff666666)),
            ),
          ));
}
