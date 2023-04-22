import 'package:base_app/core/base_controller.dart';
import 'package:base_app/schema/screen_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshAbleController extends BaseController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  int currentPage = 0;
  int limit = 10;

  void updateRefreshView() {
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }

    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
  }

  ScreenState initScreenState() {
    if (refreshController.isLoading) {
      return ScreenState.LoadMore;
    }

    if (refreshController.isRefresh) {
      return ScreenState.Refresh;
    }

    return ScreenState.Loading;
  }

  Map<String, int> getPagingParam(ScreenState screenState, {int? limit}) {
    if (screenState == ScreenState.Loading ||
        screenState == ScreenState.Refresh) {
      currentPage = 0;
    }

    return {
      'page': currentPage,
      'limit': limit ?? this.limit,
    };
  }
}
