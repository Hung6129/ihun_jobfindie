import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_response.dart';
import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/data/network/network_service.dart';
import 'package:ihun_jobfindie/configuration/data/services/global.dart';
import 'package:ihun_jobfindie/configuration/domain/models/empty_model.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
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
      final UserPostModel userPost = UserPostModel.fromJson(response.netData?.data);
      return AppResult.success(userPost);
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }

  @override
  Future<AppResult<UserProfileModel>> getProfile() async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
          url: '/api/user/find/${Global.storageServices.getString(AppStorage.userProfileKey)}',
          method: HTTPMethod.get,
          headers: {
            'token': 'Bearer ${Global.storageServices.getString(AppStorage.userTokenKey)}',
          }),
    );
    if (response is AppResultSuccess<AppResponse>) {
      final UserProfileModel userPro = UserProfileModel.fromJson(response.netData?.data);
      return AppResult.success(userPro);
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }

  @override
  Future<AppResult<EmptyModel>> signUp(String email, String password, String name)async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: '/api/register',
        method: HTTPMethod.post,
        body: {
          'email': email,
          'password': password,
          'username': name,
        },
      ),
    );

    if (response is AppResultSuccess<AppResponse>) {
      final EmptyModel emptyModel = EmptyModel();
      return AppResult.success(emptyModel);
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }
}
