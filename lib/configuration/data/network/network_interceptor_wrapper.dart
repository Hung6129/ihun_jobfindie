part of 'network_service.dart';

class NetworkInterceptorWrapper extends QueuedInterceptorsWrapper {
  late final Dio diO;

  NetworkInterceptorWrapper({required this.diO});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final header = await _headerToken();
    options.headers.addAll(header);
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Go Next when call api login || refreshToken
    if (err.requestOptions.path.contains('api/login')) {
      return handler.next(err);
    }
    // Do something with response error
    if (err.response?.statusCode == 401 ) {
      debugPrint("hello ${err.response?.data.toString()}");
      // final refreshToken = Global.storageServices.getString(AppStorage.refreshTokenKey);
      // if (refreshToken.isNotEmpty) {
      //   final response = await diO.post(
      //     'api/refresh-token',
      //     data: {'refresh_token': refreshToken},
      //     options: Options(
      //       headers: _basicToken,
      //     ),
      //   );
      //   if (response.statusCode == 200) {
      //     final token = response.data['token'];
      //     Global.storageServices.setString(AppStorage.userTokenKey, token);
      //     return handler.resolve(await diO.fetch(err.requestOptions));
      //   }
      // }
      // Global.storageServices.clear();
      // Global.navigationServices.pushNamedAndRemoveUntil(AppRoute.login);
    } else {
      return handler.next(err);
    }
  }

  Future<Map<String, String>> _headerToken() async {
    final token = Global.storageServices.getString(AppStorage.userTokenKey);
    final tokenHeader = token.isEmpty ? _basicToken : {'Authorization': 'Bearer $token'};
    return {
      ...tokenHeader,
    };
  }

  Map<String, String> get _basicToken => {
        'Authorization': 'Basic mobile:mobile',
      };
}
