import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

double _designW = 375.0;
double _designH = 765.0;
double _designD = 3.0;

void setDesignWHD(double? w, double? h, {double? density = 3.0}) {
  _designW = w ?? _designW;
  _designH = h ?? _designH;
  _designD = density ?? _designD;
}

class ScreenUtil {
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double _screenDensity = 0.0;
  double _statusBarHeight = 0.0;
  double _bottomBarHeight = 0.0;
  double _appBarHeight = 0.0;
  MediaQueryData? _mediaQueryData;

  static final ScreenUtil _singleton = ScreenUtil();

  static ScreenUtil getInstance() {
    _singleton._init();
    return _singleton;
  }

  _init() {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    if (_mediaQueryData != mediaQuery) {
      _mediaQueryData = mediaQuery;
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _screenDensity = mediaQuery.devicePixelRatio;
      _statusBarHeight = mediaQuery.padding.top;
      _bottomBarHeight = mediaQuery.padding.bottom;
      _appBarHeight = kToolbarHeight;
    }
  }

  /// screen width
  /// 屏幕 宽
  double get screenWidth => _screenWidth;


  double get screenHeight => _screenHeight;


  double get appBarHeight => _appBarHeight;

  double get screenDensity => _screenDensity;


  double get statusBarHeight => _statusBarHeight;


  double get bottomBarHeight => _bottomBarHeight;


  MediaQueryData? get mediaQueryData => _mediaQueryData;

  static double getScreenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }


  static double getScreenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }


  static double getScreenDensity(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.devicePixelRatio;
  }


  static double getStatusBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.top;
  }

  static double getBottomBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.bottom;
  }

  static MediaQueryData getMediaQueryData(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery;
  }


  static double getScaleW(BuildContext context, double size) {
    if (getScreenW(context) == 0.0) return size;
    return size * getScreenW(context) / _designW;
  }

  static double getScaleH(BuildContext context, double size) {
    if (getScreenH(context) == 0.0) return size;
    return size * getScreenH(context) / _designH;
  }


  static double getScaleSp(BuildContext context, double fontSize) {
    if (getScreenW(context) == 0.0) return fontSize;
    return fontSize * getScreenW(context) / _designW;
  }


  static Orientation getOrientation(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.orientation;
  }


  double getWidth(double size) {
    return _screenWidth == 0.0 ? size : (size * _screenWidth / _designW);
  }


  double getHeight(double size) {
    return _screenHeight == 0.0 ? size : (size * _screenHeight / _designH);
  }


  double getWidthPx(double sizePx) {
    return _screenWidth == 0.0
        ? (sizePx / _designD)
        : (sizePx * _screenWidth / (_designW * _designD));
  }

  double getHeightPx(double sizePx) {
    return _screenHeight == 0.0
        ? (sizePx / _designD)
        : (sizePx * _screenHeight / (_designH * _designD));
  }

  double getSp(double fontSize) {
    if (_screenDensity == 0.0) return fontSize;
    return fontSize * _screenWidth / _designW;
  }

  double getAdapterSize(double dp) {
    if (_screenWidth == 0 || _screenHeight == 0) return dp;
    return getRatio() * dp;
  }


  double getRatio() {
    return (_screenWidth > _screenHeight ? _screenHeight : _screenWidth) /
        _designW;
  }


  static double getAdapterSizeCtx(BuildContext context, double dp) {
    Size size = MediaQuery.of(context).size;
    if (size == Size.zero) return dp;
    return getRatioCtx(context) * dp;
  }


  static double getRatioCtx(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (size.width > size.height ? size.height : size.width) / _designW;
  }
}
