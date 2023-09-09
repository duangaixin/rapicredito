import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/page/auth/person/index.dart';
import 'package:rapicredito/widget/custom_click_view.dart';

class EmailSelectListView extends GetView<AuthPersonCtr> {
  const EmailSelectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50], borderRadius: BorderRadius.circular(8.0),
          // border: Border.all(color: Colors.white54,width: 1.0)
        ),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.state.emailEndList.length,
            padding: const EdgeInsets.only(top: 16, left: 20.0, right: 16.0),
            itemBuilder: (context, index) {
              var emailStr = controller.state.emailEndList[index];
              return CustomClickView(
                onTap: () {
                  controller.state.emailSelectIndex = index;
                  controller.state.endEmailStr =
                      controller.state.emailEndList[index];
                  if (controller.emailCtr.text.endsWith('@')) {
                    controller.emailCtr.text =
                        controller.emailCtr.text.replaceAll('@', '') +
                            controller.state.endEmailStr;
                  } else {
                    controller.emailCtr.text =
                        controller.emailCtr.text + controller.state.endEmailStr;
                  }
                  controller.emailCtr.selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.emailCtr.text.length));
                  controller.dismissOverlay();
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Obx(() {
                    var selected = controller.state.emailSelectIndex == index;
                    return Text(
                      emailStr,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: selected
                              ? const Color(0xff333333)
                              : const Color(0xff999999),
                          fontWeight:
                              selected ? FontWeight.bold : FontWeight.normal),
                    );
                  }),
                ),
              );
            }),
      ),
    );
  }
}
