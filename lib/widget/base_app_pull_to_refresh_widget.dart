import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseAppPullToRefreshWidget extends StatelessWidget {
  final Widget? child;
  final RefreshController controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final Widget? header;
  final Widget? footer;

  const BaseAppPullToRefreshWidget({
    Key? key,
    this.child,
    required this.controller,
    this.onRefresh,
    this.onLoadMore,
    this.header,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: onLoadMore != null,
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      header: header,
      footer: footer,
      child: child,
    );
  }
}

///ClassicFooter(
//         textStyle: TextStyle(
//           fontFamily: ResFonts.nunitoBold,
//           fontSize: 14,
//         ),
//         idleText: '',
//         canLoadingText: '',
//         loadingIcon: SpinKitThreeBounce(
//           color: ResColors.primaryColor,
//           size: 30,
//         ),
//         loadingText: '',
//       )///
