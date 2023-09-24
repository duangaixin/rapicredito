import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/main/home/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_color_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class NoOrderLoanItemView extends GetView<MainHomeCtr> {
  final int index;

  const NoOrderLoanItemView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.mainHomeState.notPlaceOrderList.length < 3
        ? _buildTopThreeItemView()
        : _buildNoOrderNormalLoanItemView();
  }

  Widget _buildTopThreeItemView() {
    var bean = controller.mainHomeState.dataSource[index];
    var appName = bean.unfitImpressionSingleHandSuchElectricity ?? '';
    var logoUrl = bean.bornDoubleShallowAcheActiveSparrow ?? '';
    var maxCreditAmount = bean.cleverMaidActualFoot ?? 0.0;
    var currentUserId = bean.smokeCampSpanishLift ?? -1;
    var status = bean.shortHelmetModernLatterGiftedDifference ?? '';
    var goalPath = Resource.assetsImageHomeManyGoalOne;
    var firePath = Resource.assetsImageHomeManyFireThree;
    var fireWidth=53.0;
    var noPlaceOrderIndex=bean.noPlaceOrderIndex??-1;
    if (noPlaceOrderIndex== 0) {
      goalPath = Resource.assetsImageHomeManyGoalOne;
      firePath = Resource.assetsImageHomeManyFireThree;
      fireWidth=53.0;
    } else if (noPlaceOrderIndex == 1) {
      goalPath = Resource.assetsImageHomeManyGoalTwo;
      firePath = Resource.assetsImageHomeManyFireTwo;
      fireWidth=35.0;
    } else if (noPlaceOrderIndex == 2) {
      goalPath = Resource.assetsImageHomeManyGoalThree;
      firePath = Resource.assetsImageHomeManyFireOne;
      fireWidth=17.0;
    }
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(right: 16.0, bottom: 23.0, left: 5.0),
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    CustomImageView(
                      logoUrl,
                      imageType: ImageType.network,
                      placeholder: Resource.assetsImageAuthCameraBg,
                      radius: 8.0,
                      width: 36,
                      height: 36,
                      memCacheHeight: 36,
                      memCacheWidth: 36,
                      margin: const EdgeInsets.only(
                          right: 9.0, left: 11.0, top: 12.0),
                    ),
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        child: CustomImageView(
                          goalPath,
                          width: 23.0,
                          height: 30.0,
                          imageType: ImageType.assets,
                        ))
                  ],
                ),
                Text(
                  appName,
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ),
                CustomImageView(
                  firePath,
                  width: fireWidth,
                  height: 20.0,
                  margin: const EdgeInsets.only(left: 11.0),
                  imageType: ImageType.assets,
                )
              ],
            ),
            Container(
              height: 1.0,
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.only(left: 12.0, right: 1.0),
              width: double.infinity,
              color: const Color(0xffEAEAEA),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11.0, top: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   '\$${Strings.formatPrice(maxCreditAmount.toString())}',
                    style: const TextStyle(
                        fontSize: 20.0, color: Color(0xff333333),fontWeight: FontWeight.bold),
                  ),
                  CustomColorButton(
                    realClick: (){
                      controller.clickManyProductItemBtn(status, currentUserId);
                    },
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
                    btnContent: const Text(
                      'Aplica ya',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildNoOrderNormalLoanItemView() {
    var bean = controller.mainHomeState.dataSource[index];
    var appName = bean.unfitImpressionSingleHandSuchElectricity ?? '';
    var logoUrl = bean.bornDoubleShallowAcheActiveSparrow ?? '';
    var currentUserId = bean.smokeCampSpanishLift ?? -1;
    var status = bean.shortHelmetModernLatterGiftedDifference ?? '';
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
                const Text(
                  'Ablicable',
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
                        logoUrl,
                        imageType: ImageType.network,
                        placeholder: Resource.assetsImageAuthCameraBg,
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
                    realClick: (){
                      controller.clickManyProductItemBtn(status, currentUserId);
                    },
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
                    btnContent: const Text(
                      'Aplica ya',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff333333),
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
