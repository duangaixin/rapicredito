import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_click_view.dart';

class CustomPageBgView extends StatefulWidget {
  final Widget content;
  final String title;
  final bool isShowBackBtn;
  final Function? leftAction;
  final bool resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final double titleSpace;

  const CustomPageBgView({
    Key? key,
    required this.content,
    this.title = '',
    this.leftAction,
    this.isShowBackBtn = true,
    this.resizeToAvoidBottomInset = true,
    this.titleSpace = 16.0,
    this.actions,
  }) : super(key: key);

  @override
  CustomPageBgViewState createState() => CustomPageBgViewState();
}

class CustomPageBgViewState extends State<CustomPageBgView> {
  Widget get leftView => CustomClickView(
      onTap: () {
        if (widget.leftAction != null) {
          widget.leftAction?.call();
        } else {
          Get.back();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.isShowBackBtn
              ? const Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: 16.0)
              : const SizedBox.shrink(),
          Text(widget.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colour.text33,
                fontSize: 15,
              )),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        body: Container(
          constraints: BoxConstraints.expand(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              AppBar(
                  leading: const SizedBox.shrink(),
                  leadingWidth: 0,
                  titleSpacing: widget.titleSpace,
                  centerTitle: false,
                  title: leftView,
                  actions: widget.actions),
              Expanded(child: widget.content)
            ],
          ),
        ));
  }
}
