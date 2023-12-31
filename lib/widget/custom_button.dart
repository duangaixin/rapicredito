import 'package:flutter/material.dart';
import 'package:rapicredito/widget/custom_click_view.dart';

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
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
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
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed?.throttleWithTimeout(),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledTextColor;
              }
              return textColor;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledBackgroundColor;
            }
            return backgroundColor;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return backgroundColor;
          }),
          minimumSize: (minWidth == null || minHeight == null)
              ? null
              : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(side),
        ),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: textColor),
        ));
  }
}
