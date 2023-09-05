import 'package:flutter/material.dart';

class CustomDashLine extends StatelessWidget {
  final double height;
  final Color color;
  final double width;
  final double dashWidth;

  const CustomDashLine(
      {super.key,
      this.width = double.infinity,
      this.height = 1,
      this.color = Colors.black,
      this.dashWidth = 10.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
