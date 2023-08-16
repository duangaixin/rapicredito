import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String path;
  final double radius;
  final double width;
  final double height;
  final BoxFit fit;
  final String placeholder;
  final ImageType imageType;
  final double opacity;
  final double sigmaX;
  final double sigmaY;
  final Color filterColor;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final AlignmentGeometry alignment;
  final double elevation;
  final BoxShape shape;
  final Color? borderColor;
  final double borderWidth;
  final int? memCacheWidth;
  final int? memCacheHeight;

  const CustomImageView(this.path,
      {Key? key,
      this.radius = 0.0,
      this.width = double.infinity,
      this.height = double.infinity,
      this.margin = EdgeInsets.zero,
      this.fit = BoxFit.cover,
      this.placeholder = '',
      this.imageType = ImageType.network,
      this.opacity = 1.0,
      this.sigmaX = 0.0,
      this.sigmaY = 0.0,
      this.filterColor = Colors.transparent,
      this.child,
      this.alignment = Alignment.center,
      this.padding = EdgeInsets.zero,
      this.elevation = 0.0,
      this.shape = BoxShape.rectangle,
      this.borderColor,
      this.borderWidth = 0.0,
      this.memCacheHeight,
      this.memCacheWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    switch (imageType) {
      case ImageType.network:
        imageWidget = CachedNetworkImage(
            placeholder: (context, url) => Image.asset(placeholder),
            imageUrl: path,
            fit: fit,
            memCacheWidth: memCacheWidth,
            memCacheHeight: memCacheHeight,
            errorWidget: (context, url, error) => Image.asset(placeholder));
        break;
      case ImageType.assets:
        imageWidget = Image(image: AssetImage(path), fit: fit);
        break;
      case ImageType.localFile:
        imageWidget = FadeInImage(
            placeholder: AssetImage(placeholder),
            image: FileImage(File(path)),
            fit: fit);
        break;
    }

    return Card(
        color: Colors.transparent,
        shape: shape == BoxShape.circle
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
        clipBehavior: Clip.antiAlias,
        elevation: elevation,
        margin: margin,
        child: SizedBox(
            height: height,
            width: width,
            child: Stack(children: <Widget>[
              Positioned.fill(child: imageWidget),
              Positioned.fill(
                  child: Container(
                      decoration: BoxDecoration(
                          shape: shape,
                          borderRadius: shape == BoxShape.circle
                              ? null
                              : BorderRadius.circular(radius),
                          border: Border.all(
                              color:
                                  borderColor ?? Theme.of(context).primaryColor,
                              width: borderWidth,
                              style: borderWidth == 0.0
                                  ? BorderStyle.none
                                  : BorderStyle.solid)))),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                  child: Opacity(
                      opacity: opacity,
                      child: Container(
                          color: filterColor,
                          alignment: alignment,
                          padding: padding,
                          child: child ?? const SizedBox())))
            ])));
  }
}

enum ImageType { network, assets, localFile }
