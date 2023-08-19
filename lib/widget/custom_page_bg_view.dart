import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/style/index.dart';

class CustomPageBgView extends StatefulWidget {
  final Widget content;
  final String title;
  final bool isShowBackBtn;
  final Function? leftAction;
  final bool resizeToAvoidBottomInset;
  final List<Widget>? actions;

  const CustomPageBgView({
    Key? key,
    required this.content,
    this.title = '',
    this.leftAction,
    this.isShowBackBtn = true,
    this.resizeToAvoidBottomInset = true,
    this.actions,
  }) : super(key: key);

  @override
  CustomPageBgViewState createState() => CustomPageBgViewState();
}

class CustomPageBgViewState extends State<CustomPageBgView> {
  Widget get leftView => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.isShowBackBtn
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: const Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 16.0),
                  onTap: () {
                    if (widget.leftAction != null) {
                      widget.leftAction?.call();
                    } else {
                      Get.back();
                    }
                  },
                )
              : const SizedBox.shrink(),
          Text(widget.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colour.text33,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
        ],
      );

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
                  titleSpacing: 14.0,
                  centerTitle: false,
                  title: leftView,
                  actions: widget.actions),
              Expanded(child: widget.content)
            ],
          ),
        ));
  }
}
