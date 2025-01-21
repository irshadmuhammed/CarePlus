import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // super.onError(err, handler);
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath');
    logger.d('Error type: ${err.error} \n Error message: ${err.message}');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // super.onResponse(response, handler);
    logger.d('STATUS CODE: ${response.statusCode}\n'
        'STATUS MESSAGE: ${response.statusMessage}\n'
        'HEADERS: ${response.headers}\n'
        'DATA: ${response.data}');
    handler.next(response);
  }
}
