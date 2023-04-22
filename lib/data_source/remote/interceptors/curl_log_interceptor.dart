import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import '../../../extension/extension.dart';

class CURLLogInterceptor extends Interceptor {
  CURLLogInterceptor() : super();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method.toUpperCase();

    // api end-point
    var apiEndpoint = options.baseUrl + options.path;

    if (options.queryParameters.isNotEmpty) {
      final queryArgs = <String>[];

      options.queryParameters.forEach((key, value) {
        if (value != null) {
          queryArgs.add('$key=$value');
        }
      });

      if (queryArgs.isNotEmpty) {
        apiEndpoint = '$apiEndpoint?${queryArgs.join('&')}';
      }
    }

    // data-raw
    final data = options.data;
    String? dataRaw;

    if (data is Map<String, dynamic>) {
      dataRaw = data.prettyJSONString;
    } else if (data is List<Map<String, dynamic>>) {
      dataRaw = data.prettyJSONString;
    }

    // merge
    final curlArgs = <String>[
      'curl --location --request $method \'$apiEndpoint\' \\',
    ];

    // add headers
    if (options.headers.isNotEmpty) {
      options.headers.forEach(
        (key, value) => curlArgs.add('--header \'$key: $value\' \\'),
      );
    }

    curlArgs.add('--data-raw \'${dataRaw ?? '{}'}\'');

    logPrint(curlArgs.join('\n'));

    super.onRequest(options, handler);
  }

  void logPrint(String curlRawText) {
    final message =
        '\n----------------Begin cURL request----------------\n$curlRawText\n-----------------End cURL request-----------------\n';
    developer.log(message);
  }
}
