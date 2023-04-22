import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';

export 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';

abstract class AppBaseDataDog {
  DdSdkConfiguration getDdSdkConfiguration();

  DatadogSdk get _sdk => DatadogSdk.instance;

  DdLogs? get ddLogs => _sdk.logs;

  DdRum? get ddRum => _sdk.rum;

  Future<void> init() async {
    final config = getDdSdkConfiguration();
    return await _sdk.initialize(config);
  }

  void logInfo(String message, {Map<String, dynamic> data = const {}}) {
    ddLogs?.info(message, data);
  }

  void logDebug(String message, {Map<String, dynamic> data = const {}}) {
    ddLogs?.debug(message, data);
  }

  void logWarning(String message, {Map<String, dynamic> data = const {}}) {
    ddLogs?.warn(message, data);
  }

  void logError(String message, {Map<String, dynamic> data = const {}}) {
    ddLogs?.error(message, data);
  }

  void startResource({
    required String key,
    required RumHttpMethod method,
    required String url,
    Map<String, dynamic> attributes = const {},
  }) {
    ddRum?.startResourceLoading(key, method, url, attributes);
  }

  void stopResource({
    required String key,
    required RumResourceType kind,
    int? statusCode,
    int? size,
    Map<String, dynamic> attributes = const {},
  }) {
    ddRum?.stopResourceLoading(key, statusCode, kind, size, attributes);
  }

  void addUserAction({
    required RumUserActionType type,
    required String name,
    Map<String, dynamic>? attributes,
  }) =>
      ddRum?.addUserAction(type, name, attributes ?? {});

  void startUserAction({
    required RumUserActionType type,
    required String name,
    Map<String, dynamic>? attributes,
  }) =>
      ddRum?.startUserAction(type, name, attributes ?? {});

  void stopUserAction({
    required RumUserActionType type,
    required String name,
    Map<String, dynamic>? attributes,
  }) =>
      ddRum?.stopUserAction(type, name, attributes ?? {});

  void startView({
    required String key,
    String? name,
    Map<String, dynamic>? attributes,
  }) =>
      ddRum?.startView(key, name, attributes ?? {});

  void stopView({
    required String key,
    Map<String, dynamic>? attributes,
  }) =>
      ddRum?.stopView(key, attributes ?? {});
}
