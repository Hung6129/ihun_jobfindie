import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/data/local/app_shared_pref.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_response.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';

class AuthenDataSourceRemote implements AuthenticateRepository {
  late final NetworkService _networkService;
  // late final AppSharedPref _pref;
  AuthenDataSourceRemote(this._networkService);

  // Future<void> _saveToken({required String token, required String profileKey}) async {
  //   await _pref.setValue(AppStorage.userTokenKey, token);
  //   await _pref.setValue(AppStorage.userProfileKey, profileKey);
  // }

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
      final UserPostModel tokenVo = UserPostModel.fromJson(response.netData?.data);
      // await _saveToken(token: tokenVo.token, profileKey: tokenVo.id);
      return AppResult.success(tokenVo);
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }
}
