import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({
    Key? key,
    this.hintText = '加载中...',
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final Widget progress = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.dark,
            ),
          ),
          child: const CupertinoActivityIndicator(radius: 14.0),
        ),
        Gap.vGap8,
        Text(
          hintText,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 90.0,
          width: 120.0,
          decoration: const ShapeDecoration(
            color: Color(0xFF3A3A3A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          child: progress,
        ),
      ),
    );
  }
}
