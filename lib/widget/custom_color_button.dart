import 'package:rapicredito/widget/custom_click_view.dart';
import 'package:flutter/material.dart';

class CustomColorButton extends StatelessWidget {
  const CustomColorButton({
    Key? key,
    this.colors,
    this.disableColors,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.tapCallback,
    this.btnTxt,
    this.btnContent,
    this.disable = false,
  }) : super(key: key);
  final Widget? btnContent;
  final List<Color>? colors;
  final List<Color>? disableColors;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;

  final GestureTapCallback? tapCallback;
  final bool disable;
  final String? btnTxt;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> colorList = [];
    if (disable) {
      colorList = disableColors ??
          [
            theme.primaryColor.withOpacity(0.5),
            theme.primaryColorDark.withOpacity(0.5)
          ];
    } else {
      colorList = colors ?? [theme.primaryColor, theme.primaryColorDark];
    }
    if (colorList.length < 2) return const SizedBox.shrink();
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(colors: colorList),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: disable ? null : tapCallback?.throttleWithTimeout(),
            splashColor: colorList.last,
            borderRadius: borderRadius,
            enableFeedback: !disable,
            highlightColor: Colors.transparent,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tightFor(width: width, height: height),
              child: Center(
                child: btnContent ??
                    Padding(
                      padding: const EdgeInsetsDirectional.all(13.0),
                      child: Text(btnTxt ?? '',
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white)),
                    ),
              ),
            ),
          ),
        ));
  }
}
