import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    super.key,
    this.text = '',
    this.fontSize = 18.0,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 48.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.radius = 2.0,
    this.side = BorderSide.none,
    required this.onPressed,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // 文字颜色
        foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledTextColor ;
            }
            return textColor;
          },
        ),
        // 背景颜色
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledBackgroundColor ;
          }
          return backgroundColor;
        }),
        // 水波纹
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return textColor; }),
        // 按钮最小大小
        minimumSize: (minWidth == null || minHeight == null) ? null : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(side),
      ),
      child: Text(text, style: TextStyle(fontSize: fontSize),)
    );
  }
}
