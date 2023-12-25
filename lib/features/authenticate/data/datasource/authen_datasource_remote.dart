import 'package:dio/dio.dart';
import 'package:ihun_jobfindie/configuration/data/network/net/app_response.dart';
import 'package:ihun_jobfindie/configuration/data/network/net/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';

class AuthenDataSourceRemote implements AuthenticateRepository {
  late final NetworkService _networkService;
  final Dio _dio = Dio();
  AuthenDataSourceRemote(this._networkService);
  @override
  Future<AppResult<UserPostModel>> signIn(String email, String password) async {
    final response = await _dio.post(
        'https://ihunjobfindebackend-production.up.railway.app/api/login',
        data: {
          "email": "$email",
          "password": "$password",
        });
    // _networkService.request(
    //   clientRequest: ClientRequest(
    //     url: '/api/login',
    //     method: HTTPMethod.post,
    //     body: {
    //       "email": "$email",
    //       "password": "$password",
    //     },
    //   ),
    // );
    print(response);
    if (response.statusCode == 200) {
      return AppResult.success(UserPostModel.fromJson(response.data));
    }
    if (response.statusCode == 401 || response.statusCode == 400) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }
}
