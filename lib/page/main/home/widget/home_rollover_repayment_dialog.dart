import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_three_way_view.dart';
import 'package:rapicredito/page/main/home/widget/common_pay_two_way_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeRolloverRepaymentDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRolloverRepaymentDialogState();

  const HomeRolloverRepaymentDialog({Key? key}) : super(key: key);
}

class _HomeRolloverRepaymentDialogState
    extends State<HomeRolloverRepaymentDialog> {
  var mainHomeCtr = Get.find<MainHomeCtr>();

  Widget get headerView => Container(
        margin: const EdgeInsets.only(top: 20.0),
        height: 57.0,
        child: Stack(
          children: [
            Positioned(
                bottom: 20.0,
                left: 16.0,
                child: CustomClickView(
                    onTap: () {
                      Scrollable.ensureVisible(mainHomeCtr.mainHomeState
                          .payTwoKey.currentContext as BuildContext);
                    },
                    child: const Text(
                      'Prolonga 7 días más',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ))),
            Positioned(bottom: 20.0, right: 0.0, child: closeView),
          ],
        ),
      );

  Widget get closeView => CustomClickView(
      onTap: Get.back,
      child: Container(
        alignment: Alignment.center,
        width: 36.0,
        height: 36.0,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: const Text(
          'X',
          style: TextStyle(color: Color(0xff111111), fontSize: 16.0),
        ),
      ));

  Widget get bottomCloseView => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 66.0,
        color: Colors.transparent,
        margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: closeView,
      );

  Widget get topInfoView => Container(
        padding: const EdgeInsets.only(
            top: 9.0, bottom: 20.0, left: 16.0, right: 16.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return _buildBoldKeyValueView(
                  'Actualizar la fecha de\nvencimiento',
                  mainHomeCtr.mainHomeState.updateDueDate);
            }),
            Obx(() {
              return _buildNormalKeyValueView(
                  'Tarifa extendida',
                  mainHomeCtr.addEndZero(
                      mainHomeCtr.mainHomeState.deferralCharge.toString()));
            }),
            Obx(() {
              return _buildNormalKeyValueView(
                  'Interés',
                  mainHomeCtr.addEndZero(
                      mainHomeCtr.mainHomeState.interest.toString()));
            }),
            Obx(() {
              return _buildNormalKeyValueView(
                'IVA',
                mainHomeCtr.addEndZero(
                    mainHomeCtr.mainHomeState.valueAddedTax.toString()),
              );
            }),
            Obx(() {
              return _buildNormalKeyValueView(
                  'Costo de deducción',
                  mainHomeCtr.addEndZero(
                      mainHomeCtr.mainHomeState.overduePayment.toString()));
            }),
            Obx(() {
              return _buildBoldKeyValueView(
                  'Monto del pago',
                  mainHomeCtr
                      .addEndZero(mainHomeCtr.mainHomeState.payFee.toString()));
            }),
            Obx(() {
              return _buildBoldKeyValueView(
                  'Reducción de los gastos',
                  mainHomeCtr
                      .addEndZero(mainHomeCtr.mainHomeState.feeWaiver.toString()));
            }),


          ],
        ),
      );

  Widget get overdueInfoView => Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        padding: const EdgeInsets.only(
            top: 18.0, left: 18.0, right: 17.0, bottom: 20.0),
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  Resource.assetsImageHomeLoanOverdue,
                  imageType: ImageType.assets,
                  width: 27.0,
                  height: 27.0,
                  margin: EdgeInsets.only(right: 10.0),
                ),
                Text(
                  'Advertir',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
            //TODO OBX
            Padding(
              padding: const EdgeInsets.only(
                top: 13.0,
              ),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: Strings.autoLineString('Un pago único de '),
                      style: const TextStyle(
                          fontSize: 15.0, color: Color(0xff333333)),
                      children: <TextSpan>[
                        TextSpan(
                            text: Strings.autoLineString('20000'),
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xffD53535))),
                        TextSpan(
                            text: Strings.autoLineString(
                                ', la fecha de vencimiento del reembolso se puede extender por '),
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xff333333))),
                        TextSpan(
                            text: Strings.autoLineString(' días'),
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xffD53535))),
                        TextSpan(
                            text: Strings.autoLineString(
                                '.El pago de una suma  inferior a '),
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xff333333))),
                        TextSpan(
                            text: Strings.autoLineString('7777'),
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xffD53535))),
                        TextSpan(
                            text: Strings.autoLineString(
                                '  no cambia el limite de la fecha de devolución. Debe pagar a tiempo.'),
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xff333333))),
                      ])),
            )
          ],
        ),
      );

  Widget _buildNormalKeyValueView(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xff666666),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xff666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoldKeyValueView(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 15.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              headerView,
              topInfoView,
              overdueInfoView,
              CommonPayTwoWayView(
                key: mainHomeCtr.mainHomeState.payTwoKey,
                isRollover: true,
              ),
              const SizedBox(
                height: 19.0,
              ),
              const CommonPayThreeWayView(isRollover: true),
              bottomCloseView
            ],
          ),
        ),
      ),
    );
  }
}
