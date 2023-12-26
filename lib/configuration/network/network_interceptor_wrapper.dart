part of 'network_service.dart';

class NetworkInterceptorWrapper extends QueuedInterceptorsWrapper {
  late final Dio diO;

  NetworkInterceptorWrapper({required this.diO});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Go Next when call api login || refreshToken
    debugPrint('Dio Error Path: ${err.requestOptions.path}');
    if (err.requestOptions.path.contains('api/login')) {
      return handler.next(err);
    }
    // Do something with response error
    if (err.response?.statusCode == 401) {
      print('Dio Error: ${err.response?.statusCode}');
    } else {
      return handler.next(err);
    }
  }
}
