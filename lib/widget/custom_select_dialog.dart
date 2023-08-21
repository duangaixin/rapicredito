import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';

class CustomSelectDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomSelectDialogState();
  final List<String> radioList;
  final String title;
  final List<int> radioSelectedIndexList;
  final Function(List<int> selectedList) clickConfirmEvent;
  final double dialogHeight;

  const CustomSelectDialog({
    Key? key,
    this.title = '',
    this.dialogHeight = 480.0,
    required this.radioList,
    required this.radioSelectedIndexList,
    required this.clickConfirmEvent,
  }) : super(key: key);
}

class _CustomSelectDialogState extends State<CustomSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.radioList.isEmpty
        ? const SizedBox.shrink()
        : Container(
            height: widget.dialogHeight,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white),
            child: Column(
              children: [
                _buildTitleView(),
                Expanded(
                    child: ListView.builder(
                        itemExtent: 44.0,
                        padding: const EdgeInsets.only(bottom: 20.0),
                        itemBuilder: (context, index) {
                          return _buildItemView(index);
                        },
                        itemCount: widget.radioList.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        primary: false))
              ],
            ),
          );
  }

  Widget _buildTitleView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                'cancel',
                style: TextStyle(fontSize: 18.0, color: Color(0xff44414B)),
                textAlign: TextAlign.left,
              )),
        ),
        Expanded(
            child: Text(
          widget.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color(0xff44414B)),
          textAlign: TextAlign.center,
        )),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            widget.clickConfirmEvent(widget.radioSelectedIndexList);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'confirm',
              style: TextStyle(fontSize: 18, color: Colour.themeColor),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemView(int index) {
    var name = widget.radioList[index];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 44.0,
        child: Text(
          name,
          style: TextStyles.textNormal16,
        ),
      ),
      onTap: () {
        if (widget.radioSelectedIndexList.contains(index)) {
          widget.radioSelectedIndexList.remove(index);
        } else {
          widget.radioSelectedIndexList.add(index);
        }
        _notifyPage();
      },
    );
  }

  void _notifyPage() {
    if (mounted) {
      setState(() {});
    }
  }
}
