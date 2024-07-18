import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/constants/app_urls.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';

import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'nets/app_exception.dart';
import 'nets/app_response.dart';
import 'nets/app_result.dart';

part 'client_request.dart';

part 'network_interceptor_wrapper.dart';

abstract class NetworkService extends GetxService {
  static const requestTimeOut = Duration(seconds: 120);

  static Dio newDio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: requestTimeOut,
      receiveTimeout: requestTimeOut,
    ));
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: false,
      requestHeader: true,
    ));

    return dio;
  }

  Future<AppResult<AppResponse>> request({required ClientRequest clientRequest});
}

class NetworkServiceImpl extends NetworkService {
  late final Dio _dio;
  late final Logger _logger;

  @override
  void onInit() async {
    super.onInit();
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
    _dio = NetworkService.newDio();
    _dio.interceptors.add(
      NetworkInterceptorWrapper(diO: _dio),
    );
  }

  @override
  Future<AppResult<AppResponse>> request({required ClientRequest clientRequest}) async {
    try {
      final response = await _dio.request(
        clientRequest.url,
        data: clientRequest.body,
        options: Options(
          method: clientRequest.method.value,
          contentType: clientRequest.contentType,
          headers: {
            ...clientRequest.headers ?? {},
          },
        ),
        queryParameters: clientRequest.query,
        onSendProgress: clientRequest.onSendProgress,
        onReceiveProgress: clientRequest.onReceiveProgress,
      );
      final AppResponse appResponse = clientRequest.isRequestForList
          ? AppResponse.fromJsonToList(response.data)
          : AppResponse.fromJson(response.data);
      return HttpStatus(response.statusCode).isOk
          ? AppResult.success(
              appResponse,
            )
          : AppResult.failure(
              NetworkException(
                code: response.statusCode,
                message: appResponse.meta?.message,
                errorCode: appResponse.meta?.errorMessages,
              ),
            );
    } on DioException catch (e) {
      _logger.e('Response: DioError: ${e.response?.data}');
      Metadata? meta = AppResponse.fromJson(e.response?.data).meta;
      return AppResult.failure(
        NetworkException(
          code: e.response?.statusCode,
          message: meta?.message,
          errorCode: meta?.errorMessages ?? 'network_service',
        ),
      );
    } catch (e) {
      _logger.e('Some things wrong: ${e.toString()}');
      return AppResult.failure(NetworkException(
        code: 999999,
        message: 'SomeThingsWrong: ${e.toString()}',
        errorCode: 'network_service',
      ));
    }
  }
}
