import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class LoanStatusItemView extends GetView<MainHomeCtr> {
  final int index;

  const LoanStatusItemView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItemView();
  }

  Widget _buildItemView() {
    var bean = controller.mainHomeState.dataSource[index];
    var appName = bean.unfitImpressionSingleHandSuchElectricity ?? '';
    var logoUrl = bean.bornDoubleShallowAcheActiveSparrow ?? '';
    var status = bean.shortHelmetModernLatterGiftedDifference ?? '';
    var statusName = '';
    var btnText = '';
    var btnDisable = false;
    if (status == '3') {
      statusName = 'Bajo Revisión';
      btnText = 'Espere por favor';
      btnDisable = true;
    } else if (status == '6') {
      statusName = 'Devolución Pendiente';
      btnText = 'Pagar';
      btnDisable = false;
    } else if (status == '2') {
      statusName = 'Atrasado';
      btnText = 'Pagar';
      btnDisable = false;
    } else if (status == '4') {
      statusName = 'Solicitud rechazado';
      btnText = 'Aplica ya';
      btnDisable = true;
    } else if (status == '5') {
      statusName = 'Dispersión fallida';
      btnText = 'Actualizar datos';
      btnDisable = false;
    }
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
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
                  statusName,
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
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
                        logoUrl,
                        imageType: ImageType.network,
                        radius: 8.0,
                        width: 36,
                        height: 36,
                        memCacheHeight: 36,
                        memCacheWidth: 36,
                        margin: const EdgeInsets.only(
                            right: 9.0, left: 11.0, top: 12.0),
                      ),
                      Text(
                        appName,
                        style: const TextStyle(
                            fontSize: 15.0, color: Color(0xff333333)),
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
                    disable: btnDisable,
                    colors: const [Color(0xffB8EF17), Color(0xffB8EF17)],
                    height: 46.0,
                    width: 152.0,
                    borderRadius: BorderRadius.circular(8.0),
                    btnContent: Text(
                      btnText,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: btnDisable
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
            color: const Color(0xffE8E8E8),
          ),
        ],
      ),
    );
  }
}
