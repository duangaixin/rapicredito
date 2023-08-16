import 'dart:async';
import 'package:flutter/material.dart';

class CustomClickView extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  final ClickType type;
  final int? timeout;

  const CustomClickView(
      {Key? key,
      required this.child,
      this.onTap,
      this.type = ClickType.throttleWithTimeout,
      this.timeout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _getOnTap(),
      child: child,
    );
  }

  VoidCallback? _getOnTap() {
    if (type == ClickType.throttle) {
      return onTap?.throttle();
    } else if (type == ClickType.throttleWithTimeout) {
      return onTap?.throttleWithTimeout(timeout: timeout);
    } else if (type == ClickType.debounce) {
      return onTap?.debounce(timeout: timeout);
    }
    return () => onTap?.call();
  }
}

enum ClickType { none, throttle, throttleWithTimeout, debounce }

extension FunctionExt on Function {
  VoidCallback throttle() {
    return FunctionProxy(this).throttle;
  }

  VoidCallback throttleWithTimeout({int? timeout}) {
    return FunctionProxy(this, timeout: timeout).throttleWithTimeout;
  }

  VoidCallback debounce({int? timeout}) {
    return FunctionProxy(this, timeout: timeout).debounce;
  }
}

class FunctionProxy {
  static final Map<String, bool> _funcThrottle = {};
  static final Map<String, Timer> _funcDebounce = {};
  final Function? target;

  final int timeout;

  FunctionProxy(this.target, {int? timeout}) : timeout = timeout ?? 500;

  void throttle() async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      try {
        await target?.call();
      } catch (e) {
        rethrow;
      } finally {
        _funcThrottle.remove(key);
      }
    }
  }

  void throttleWithTimeout() {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      Timer(Duration(milliseconds: timeout), () {
        _funcThrottle.remove(key);
      });
      target?.call();
    }
  }

  void debounce() {
    String key = hashCode.toString();
    Timer? timer = _funcDebounce[key];
    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeout), () {
      Timer? t = _funcDebounce.remove(key);
      t?.cancel();
      target?.call();
    });
    _funcDebounce[key] = timer;
  }
}
