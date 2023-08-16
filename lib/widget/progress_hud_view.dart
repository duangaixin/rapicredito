import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

const Color _bgColor = Color(0xff171717);
const double _radius = 10.0;
const int _closeTime = 5000;
// 表示是否该分组内是否在同一时间里只存在一个Toast,区分是哪一个组是按照[groupKey]来区分的,默认false
const bool _onlyOne = true;
// 是否在点击屏幕触发事件时自动关闭该Toast,默认false
const bool _clickClose = false;
// 是否跨页面显示,如果为true,则该Toast会跨越多个Route显示,如果为false则在当前Route发生变化时,会自动关闭该Toast,默认true
// 注意，设置为false时，如果需要在全屏弹框回调中展示toast，可以添加100延时
const bool _crossPage = false;
// 点击穿透toast显示区域,为true可以穿透,默认false
const bool _ignoreContentClick = false;
// 是否在该Loading Toast显示时,能否正常点击触发事件,默认false
const bool _allowClickLoading = false;
// 是否允许该Loading跨页面显示,如果为true,则该Toast会跨越多个Route显示,如果为false则在当前Route发生变化时,会自动关闭该Toast,默认false
const bool _crossPageLoading = false;
// 点击物理返回键的行为(在android上等同于物理的返回键)
const BackButtonBehavior _backButtonBehavior = BackButtonBehavior.close;
// Toast显示位置,中间往上一点
const Alignment _alignment = Alignment(0.0, -0.2);

enum _ToastType {
  text,
  success,
  error,
  info,
  loading,
}


class ProgressHUD {
  static showText(String loadingText,
      {Alignment alignment = Alignment.center}) {
    return _showToast(loadingText, _ToastType.text, alignment: alignment);
  }

  static showSuccess(String loadingText,
      {Alignment alignment = Alignment.center}) {
    return _showToast(loadingText, _ToastType.success, alignment: alignment);
  }

  static showError(String loadingText,
      {Alignment alignment = Alignment.center}) {
    return _showToast(loadingText, _ToastType.error, alignment: alignment);
  }

  static showInfo(String loadingText,
      {Alignment alignment = Alignment.center}) {
    return _showToast(loadingText, _ToastType.info, alignment: alignment);
  }

  static showLoadingText([loadingText = '加载中...']) {
    return _showLoading(loadingText);
  }

  static hide() {
    BotToast.closeAllLoading();
  }
}

CancelFunc _showToast(loadingText, _ToastType toastType,
    {Alignment alignment = Alignment.center}) {
  return BotToast.showCustomText(
    duration: const Duration(milliseconds: _closeTime),
    align: alignment,
    onlyOne: _onlyOne,
    clickClose: _clickClose,
    crossPage: _crossPage,
    ignoreContentClick: _ignoreContentClick,
    backButtonBehavior: _backButtonBehavior,
    backgroundColor: Colors.transparent,
    toastBuilder: (cancelFunc) => _showCustomToast(loadingText, toastType),
  );
}

CancelFunc _showLoading(loadingText) {
  return BotToast.showCustomLoading(
    align: _alignment,
    clickClose: _clickClose,
    allowClick: _allowClickLoading,
    crossPage: _crossPageLoading,
    ignoreContentClick: _ignoreContentClick,
    backButtonBehavior: _backButtonBehavior,
    backgroundColor: Colors.transparent,
    toastBuilder: (cancelFunc) =>
        _showCustomToast(loadingText, _ToastType.loading),
  );
}

Widget _showCustomToast(loadingText, _ToastType toastType) {
  Container topWidget;
  if (toastType == _ToastType.text) {
    topWidget = Container();
  } else if (toastType == _ToastType.loading) {
    topWidget = Container(
      width: 34.0,
      height: 34.0,
      margin: const EdgeInsets.only(top: 8.33, bottom: 16),
      child: const CupertinoActivityIndicator(
        color: Colors.white,
        radius: 16.0,
      ),
    );
  } else {
    IconData? icon;
    if (toastType == _ToastType.success) {
      icon = Icons.check_circle_outline;
    }
    if (toastType == _ToastType.error) {
      icon = Icons.highlight_off;
    }
    if (toastType == _ToastType.info) {
      icon = Icons.info_outline;
    }
    topWidget = Container(
      width: 34,
      height: 34,
      margin: const EdgeInsets.only(top: 8.33, bottom: 16),
      child: Icon(icon, size: 33.3, color: Colors.white),
    );
  }

  var w = Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.67, vertical: 13.33),
    width: toastType == _ToastType.text ? 246.67 : 230,
    decoration: BoxDecoration(
        color: _bgColor, borderRadius: BorderRadius.circular(_radius)),
    child: ClipRect(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Visibility(
            visible: toastType != _ToastType.text,
            child: topWidget,
          ),
          Text(loadingText,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center),
        ],
      ),
    ),
  );
  return w;
}
