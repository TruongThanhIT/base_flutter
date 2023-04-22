import 'package:base_app/schema/screen_data.dart';
import 'package:flutter/material.dart';

class BaseAppStateContainerWidget extends StatelessWidget {
  final ScreenData? data;
  final Widget? successWidget;
  final Widget? idealWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final bool? isShowEmptyState;
  final VoidCallback? onRetry;

  BaseAppStateContainerWidget({
    this.data,
    this.successWidget,
    this.idealWidget,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.isShowEmptyState = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    Widget? widget;

    switch (data?.screenState) {
      case ScreenState.Ideal:
        widget = idealWidget ?? Container();
        break;

      case ScreenState.Loading:
        widget = loadingWidget;
        break;

      case ScreenState.Success:
        if (isShowEmptyState == true) {
          widget = emptyWidget;
        } else {
          widget = successWidget;
        }
        break;

      case ScreenState.Error:
        widget = errorWidget;
        break;

      case ScreenState.Refresh:
      case ScreenState.LoadMore:
        widget = successWidget;
        break;

      case null:
        break;
    }

    return Container(
      child: widget,
    );
  }
}
