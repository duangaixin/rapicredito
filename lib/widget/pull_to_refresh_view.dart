import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshView extends StatelessWidget {
  final RefreshController _refreshController;
  final bool? enablePullDown;
  final bool? enablePullUp;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final Widget? header;
  final Widget? footer;
  final Widget child;

  const PullToRefreshView(this._refreshController,
      {Key? key,
      this.enablePullDown,
      this.enablePullUp,
      this.onRefresh,
      this.onLoadMore,
      this.header,
      this.footer,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: enablePullDown ?? true,
      enablePullUp: enablePullUp ?? true,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      header: header ?? getCustomHeader(),
      footer: footer ?? getCustomFooter(),
      child: child,
    );
  }

  Widget getClassicHeader() {
    return const ClassicHeader(
      refreshStyle: RefreshStyle.Follow,
      releaseText: '释放刷新',
      releaseIcon: CupertinoActivityIndicator(radius: 10.0),
      completeText: '刷新完成',
      completeIcon: Icon(
        Icons.done,
        color: Colors.grey,
      ),
      failedText: '刷新失败',
      failedIcon: Icon(
        Icons.error,
        color: Colors.grey,
      ),
      refreshingText: '正在刷新',
      refreshingIcon: SizedBox(
        width: 25.0,
        height: 25.0,
        child: CupertinoActivityIndicator(),
      ),
      idleText: '下拉刷新',
      idleIcon: Icon(
        Icons.arrow_downward,
        color: Colors.grey,
      ),
    );
  }

  Widget getClassicFooter() {
    return ClassicFooter(
      loadingText: '正在加载',
      loadingIcon: const SizedBox(
        width: 25.0,
        height: 25.0,
        child: CupertinoActivityIndicator(),
      ),
      noDataText: '没有更多',
      noMoreIcon: Container(),
      idleText: '上拉加载更多',
      idleIcon: const Icon(Icons.arrow_upward, color: Colors.grey),
      failedText: '加载失败，上拉试试',
      failedIcon: const Icon(Icons.error, color: Colors.grey),
      canLoadingText: '释放加载更多',
      canLoadingIcon: const Icon(Icons.autorenew, color: Colors.grey),
    );
  }

  Widget getCustomHeader() {
    return MaterialClassicHeader();
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget header;
        if (mode == RefreshStatus.idle) {
          header = const Text(
            '下拉刷新',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        } else if (mode == RefreshStatus.refreshing) {
          header = const Text(
            '正在刷新',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        } else if (mode == RefreshStatus.failed) {
          header = const Text(
            '刷新失败',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        } else if (mode == RefreshStatus.completed) {
          ///加载成功
          header = const Text(
            '刷新成功',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        } else {
          header = const Text(
            '释放刷新',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        }
        return SizedBox(
          height: 64,
          child: Center(child: header),
        );
      },
    );
  }

  Widget getCustomFooter() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget footer;
        if (mode == LoadStatus.idle) {
          footer = const Text('上拉加载');
        } else if (mode == LoadStatus.loading) {
          footer = const Text('正在加载');
        } else if (mode == LoadStatus.failed) {
          footer = const Text(
            '刷新失败',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        } else {
          footer = const Text(
            '没有更多数据',
            style: TextStyle(color: Color(0xFFB8C0D4), fontSize: 14),
          );
        }
        return SizedBox(
          height: 60,
          child: Center(child: footer),
        );
      },
    );
  }
}
