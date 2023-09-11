import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/loan/index.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class LoanDateTopView extends GetView<LoanMoneyDateCtr> {
  const LoanDateTopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Monto del préstamo',
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold),
        ),
        Obx(() {
          return GridView.builder(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11,
                  childAspectRatio: 2.61),
              itemBuilder: (context, index) {
                return _buildMoneyItemView(index);
              },
              itemCount: controller.state.moneyList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false);
        }),
        const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 7.0),
            child: Text(
              'Obtén un descuento en tu próximo préstamo',
              style: TextStyle(fontSize: 15.0, color: Color(0xffD53535)),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 7.0, bottom: 16.0),
            child: Text(
              '${controller.state.incrementStep.toString()}\$',
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Color(0xffD53535),
                  fontWeight: FontWeight.bold),
            )),
        const Text(
          'Por favor, elija la fecha de reembolso',
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold),
        ),
        GridView.builder(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 11,
                mainAxisSpacing: 11,
                childAspectRatio: 2.61),
            itemBuilder: (context, index) {
              return _buildDateItemView(index);
            },
            itemCount:controller.state.dateList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false),
      ],
    );
  }

  Widget _buildMoneyItemView(int index) {
    var bean = controller.state.moneyList[index];
    var content = '\$ ${bean.money}';
    var canClick = bean.canClick;
    return Obx(() {
      var isSelected = controller.state.moneySelectIndex == index;
      var bgColor = isSelected ? const Color(0xff333333) : Colors.white;

      return GestureDetector(
        onTap: () {
          if (canClick) {
            if (controller.state.moneySelectIndex != index) {
              controller.state.moneySelectIndex = index;
              controller.state.moneyList[index].isSelected =
                  controller.state.moneySelectIndex == index;
              controller.state.applyAmount = bean.money;
              controller.postTestCalculateRequest(isShowDialog: true);
            }
          } else {
            controller.showDateMoneySelectDialog();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
            height: 41.0,
            decoration: BoxDecoration(
                color: !canClick ? const Color(0xffDFDFDF) : bgColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: !canClick
                        ? Colors.transparent
                        : const Color(0xff333333),
                    width: 1.0)),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(controller.dealEndZero(content),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xff333333))),
                Visibility(
                    visible: !canClick,
                    child: const CustomImageView(
                      Resource.assetsImageLoanLock,
                      imageType: ImageType.assets,
                      width: 21.0,
                      height: 25.0,
                      fit: BoxFit.contain,
                    ))
              ],
            )),
      );
    });
  }

  Widget _buildDateItemView(int index) {
    var bean = controller.state.dateList[index];
    var content = bean.dateStr;
    var canClick = bean.canClick;

    return Obx(() {
      var isSelected = controller.state.dateSelectIndex == index;
      var bgColor = isSelected ? const Color(0xff333333) : Colors.white;
      return GestureDetector(
        onTap: () {
          if (canClick) {
            if (controller.state.dateSelectIndex != index) {
              controller.state.dateSelectIndex = index;
              controller.state.dateList[index].isSelected =
                  controller.state.dateSelectIndex == index;
              controller.state.detailId = bean.detailId;
              controller.state.repaymentDate = bean.dateStr;
              controller.postTestCalculateRequest(isShowDialog: true);
            }
          } else {
            controller.showDateMoneySelectDialog();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
            height: 41.0,
            decoration: BoxDecoration(
                color: !canClick ? const Color(0xffDFDFDF) : bgColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: !canClick
                        ? Colors.transparent
                        : const Color(0xff333333),
                    width: 1.0)),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xff333333))),
                Visibility(
                    visible: !canClick,
                    child: const CustomImageView(
                      Resource.assetsImageLoanLock,
                      imageType: ImageType.assets,
                      width: 21.0,
                      height: 25.0,
                      fit: BoxFit.contain,
                    ))
              ],
            )),
      );
    });
  }
}
