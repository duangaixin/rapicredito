import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/page/main/home/widget/common_agreement_view.dart';
import 'package:rapicredito/page/main/home/widget/common_app_bar_view.dart';
import 'package:rapicredito/page/main/home/widget/common_loan_money_view.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeLoanDealView extends GetView<MainHomeCtr> {
  const HomeLoanDealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const MainAppBarView(
                    title: 'Préstamo fallido',
                  ),
                const CommonLoanMoneyView(),
                  dealTipView,
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: CommonAgreeView(),
                  )
                ],
              ),
            )),
      );
    });
  }

  Widget get dealTipView => Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 29.0),
      padding:
          const EdgeInsets.only(left: 3.0, right: 8.0, top: 9.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(8.0)),
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(
            Resource.assetsImageAuthFace,
            imageType: ImageType.assets,
            width: 66.0,
            height: 66.0,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 11.0),
            child: Text(
              'Su solicitud ha sido aprobado.\nSu préstamo está llegando en su cuenta.',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff666666),
              ),
            ),
          ))
        ],
      ));
}
