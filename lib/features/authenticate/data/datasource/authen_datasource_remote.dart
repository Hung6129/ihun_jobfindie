import 'package:ihun_jobfindie/configuration/network/nets/app_response.dart';
import 'package:ihun_jobfindie/configuration/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/network/network_service.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';

class AuthenDataSourceRemote implements AuthenticateRepository {
  late final NetworkService _networkService;
  AuthenDataSourceRemote(this._networkService);
  @override
  Future<AppResult<UserPostModel>> signIn(String email, String password) async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: '/api/login',
        method: HTTPMethod.post,
        body: {
          'email': email,
          'password': password,
        },
      ),
    );

    if (response is AppResultSuccess<AppResponse>) {
      final UserPostModel tokenVo =
          UserPostModel.fromJson(response.netData?.data);
      return AppResult.success(tokenVo);
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }
}
