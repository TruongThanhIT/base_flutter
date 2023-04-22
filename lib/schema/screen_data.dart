class ScreenData<T> {
  T? data;
  String? message;
  List<String?>? messages;
  ScreenState screenState;

  ScreenData({
    this.data,
    this.message,
    this.messages,
    this.screenState = ScreenState.Ideal,
  });
}

enum ScreenState {
  Ideal,
  Loading,
  Refresh,
  LoadMore,
  Success,
  Error,
}
