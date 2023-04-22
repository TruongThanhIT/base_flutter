import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'interceptors/interceptors.dart';

@Deprecated('Use BaseApiClientV2')
abstract class BaseApiClient {
  Dio getDio({
    required String endpoint,
    int? timeOut,
    String? contentType,
  }) {
    var dio = Dio();

    // API end point
    dio.options.baseUrl = endpoint;

    // Set time out
    dio.options.connectTimeout = timeOut ?? 20000;
    dio.options.receiveTimeout = timeOut ?? 20000;
    dio.options.contentType = contentType ?? 'application/json';

    if (kDebugMode) {
      dio.interceptors.add(
        // Log
        BaseLogInterceptor(logPrint: logPrint),
      );
    }

    dio.interceptors.addAll([
      InterceptorsWrapper(onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        var header = getHeaders();

        if (header != null) {
          options.headers.addAll(header);
        }

        return handler.next(options);
      }, onError: (DioError e, ErrorInterceptorHandler handler) {
        if (e.response?.statusCode == 401) {
          onTokenExpired();
          return;
        }
        return handler.next(e);
      }),
    ]);
    return dio;
  }

  Map<String, dynamic>? getHeaders();

  void onTokenExpired();

  void logPrint(Object? object) {
    if (object != null) {
      developer.log(object.toString());
    }
  }
}

abstract class BaseApiClientV2 {
  Dio getDio({
    required String endpoint,
    int? timeOut,
    String? contentType,
    Interceptor? initialUnauthorizedInterceptor,
  }) {
    var dio = Dio();

    // API end point
    dio.options.baseUrl = endpoint;

    // Set time out
    dio.options.connectTimeout = timeOut ?? 20000;
    dio.options.receiveTimeout = timeOut ?? 20000;
    dio.options.contentType = contentType ?? 'application/json';

    if (kDebugMode) {
      dio.interceptors.add(
        // Log
        BaseLogInterceptor(logPrint: logPrint),
      );
    }

    dio.interceptors.add(defaultRequestInterceptor);

    dio.interceptors
        .add(initialUnauthorizedInterceptor ?? defaultUnauthorizedInterceptor);

    return dio;
  }

  Map<String, dynamic>? getHeaders();

  Future<Map<String, dynamic>?>? getHeadersAsync();

  Interceptor get defaultUnauthorizedInterceptor {
    return InterceptorsWrapper(
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          onTokenExpiredWithData(e, handler);
          return;
        }

        return handler.next(e);
      },
    );
  }

  Interceptor get defaultRequestInterceptor {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final header = getHeaders();

        var headerAsync = await getHeadersAsync();

        if (header != null) {
          options.headers.addAll(header);
        }

        if (headerAsync != null) {
          options.headers.addAll(headerAsync);
        }

        return handler.next(options);
      },
    );
  }

  void onTokenExpired();

  void onTokenExpiredWithData(DioError err, ErrorInterceptorHandler handler) {
    onTokenExpired();
  }

  void logPrint(Object? object) {
    if (object != null) {
      developer.log(object.toString());
    }
  }
}
