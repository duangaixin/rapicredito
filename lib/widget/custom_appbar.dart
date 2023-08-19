import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String? title;
  final Widget? titleView;
  final List<Widget>? actions;
  final Widget? leftBtn;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final String? backImgName;
  final bool isBack;
  final bool isCenterTitle;
  final VoidCallback? leftAction;
  final double bottomHeight;
  final bool isShowBottomLine;
  final double? titleSpacing;

  const CustomAppBar(
      {Key? key,
      this.isCenterTitle = true,
      this.isBack = true,
      this.title,
      this.actions,
      this.titleStyle,
      this.backgroundColor,
      this.backImgName,
      this.leftAction,
      this.leftBtn,
      this.titleView,
      this.bottom,
      this.titleSpacing,
      this.isShowBottomLine = true,
      this.bottomHeight = 0.0})
      : super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(
      bottom == null ? kToolbarHeight : kToolbarHeight + bottomHeight);
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
          ),
        ),
        AppBar(
          key: widget.key,
          centerTitle: widget.isCenterTitle,
          title: widget.titleView ??
              Text(
                widget.title ?? '',
                style: widget.titleStyle ??
                    const TextStyle(color: Color(0xFF505470), fontSize: 17.0),
              ),
          leading: widget.isBack
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 19,
                  ),
                  onPressed: widget.leftAction)
              : widget.leftBtn,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: widget.titleSpacing,
          bottom: AppBarBottom(
            bottomHeight: widget.bottomHeight,
            child: widget.bottom,
          ),
          actions: widget.actions,
        )
      ],
    );
  }
}

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final double bottomHeight;
  final bool isShowBottomLine;

  const AppBarBottom(
      {Key? key,
      this.child,
      this.bottomHeight = 0.0,
      this.isShowBottomLine = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).devicePixelRatio;
    double lineHeight = 1.0 / scale;
    return Stack(
      children: <Widget>[
        isShowBottomLine
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: lineHeight,
                    color: const Color.fromRGBO(204, 208, 220, 0.8),
                  ),
                  child ?? const SizedBox.shrink(),
                ],
              )
            : child ?? const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottomHeight);
}
