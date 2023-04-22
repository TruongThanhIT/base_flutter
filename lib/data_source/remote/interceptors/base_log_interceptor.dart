import 'package:dio/dio.dart';

class BaseLogInterceptor extends LogInterceptor {
  BaseLogInterceptor({
    bool request = true,
    bool requestBody = true,
    bool requestHeader = true,
    bool responseBody = true,
    bool error = true,
    required Function(Object object) logPrint,
  }) : super(
          request: request,
          requestBody: requestBody,
          requestHeader: requestHeader,
          responseBody: responseBody,
          error: error,
          logPrint: logPrint,
        );
}
