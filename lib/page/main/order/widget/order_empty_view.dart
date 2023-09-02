import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/order/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class OrderEmptyView extends GetView<MainOrderCtr> {
  const OrderEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          MainAppBarView(
            title: 'RapiCrédito',
          ),
          CustomImageView(
            Resource.assetsImageOrderEmpty,
            imageType: ImageType.assets,
            width: 96.0,
            height: 94.0,
            margin: EdgeInsets.only(top: 65.0, bottom: 37.0),
            fit: BoxFit.cover,
          ),
          Text(
            'No se concentric orden relacionado',
            style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
          )
        ],
      ),
    );
  }

  Widget _buildAppInfoView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImageView(
          '',
          placeholder: Resource.assetsImageAuthCameraBg,
          width: 44.0,
          height: 44.0,
          radius: 8.0,
          margin: EdgeInsets.only(right: 10.0),
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1111',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text(
                  '2322323',
                  style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
                ))
          ],
        )
      ],
    );
  }

  Widget _buildLineView() {
    return Container(
      height: 1.0,
      color: const Color(0xffE8E8E8),
      width: double.infinity,
    );
  }

  Widget _buildErrorInfoView() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        alignment: Alignment.centerLeft,
        child: const Text(
          '¡Has pagado con éxito',
          style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
        ));
  }

  Widget _buildBottomView() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 28.0),
      child: CustomButton(
        onPressed: () {},
        minWidth: 254.0,
        minHeight: 46.0,
        backgroundColor: const Color(0xffB8EF17),
        disabledBackgroundColor: const Color(0xffB8EF17),
        fontSize: 15.0,
        radius: 8.0,
        text: 'Volver a solicitar',
        textColor: const Color(0xff333333),
      ),
    );
  }
}
