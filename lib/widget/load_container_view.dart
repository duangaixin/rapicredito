import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadContainerView extends StatefulWidget {
  final LoadState loadState;
  final Widget? loadingView;
  final Widget? errorView;
  final Widget? emptyView;
  final Widget contentView;
  final VoidCallback? onReload;
  final String? errorTip;
  final String? emptyTip;

  const LoadContainerView(
      {Key? key,
      required this.contentView,
      required this.loadState,
      this.emptyView,
      this.errorView,
      this.loadingView,
      this.onReload,
      this.errorTip,
      this.emptyTip})
      : super(key: key);

  @override
  createState() => _LoadContainerViewState();
}

class _LoadContainerViewState extends State<LoadContainerView> {
  @override
  Widget build(BuildContext context) {
    Widget currentWidget;
    switch (widget.loadState) {
      case LoadState.loading:
        currentWidget = widget.loadingView ?? const ClassicalLoadingView();
        break;
      case LoadState.failed:
        currentWidget = widget.errorView ??
            ClassicalErrorView(
                onReload: widget.onReload, errorTip: widget.errorTip);
        break;
      case LoadState.empty:
        currentWidget = widget.emptyView ??
            ClassicalEmptyView(
              emptyTip: widget.emptyTip,
              onReload: widget.onReload,
            );
        break;
      case LoadState.succeed:
        currentWidget = widget.contentView;
        break;
    }
    return currentWidget;
  }
}

class ClassicalErrorView extends StatelessWidget {
  const ClassicalErrorView({Key? key, this.onReload, this.errorTip})
      : super(key: key);

  final Function()? onReload;
  final String? errorTip;

  @override
  Widget build(BuildContext context) => Center(
          child: GestureDetector(
        onTap: onReload,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.portable_wifi_off,
                  size: 70, color: Color(0xFFB8C0D4)),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(errorTip ?? 'error',
                      style: const TextStyle(
                          fontSize: 12.0, color: Color(0xFFB8C0D4)))),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
            ]),
      ));
}

class ClassicalEmptyView extends StatelessWidget {
  final String? emptyTip;
  final VoidCallback? onReload;

  const ClassicalEmptyView({Key? key, this.onReload, this.emptyTip})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
          child: GestureDetector(
        onTap: onReload,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.signal_cellular_no_sim,
                  size: 70, color: Colors.grey[300]),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(emptyTip ?? 'empty data',
                      style: const TextStyle(
                          fontSize: 12.0, color: Color(0xFFB8C0D4))))
            ]),
      ));
}

class ClassicalLoadingView extends StatelessWidget {
  const ClassicalLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: const <Widget>[
          CupertinoActivityIndicator(radius: 17.0),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('loading...', style: TextStyle(fontSize: 14)))
        ]),
      );
}

enum LoadState { loading, succeed, failed, empty }
