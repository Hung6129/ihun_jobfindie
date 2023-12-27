import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/domain/models/empty_model.dart';
import 'package:ihun_jobfindie/features/authenticate/data/datasource/authen_datasource_remote.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';

abstract class AuthenticateRepository {
  Future<AppResult<UserPostModel>> signIn(String email, String password);
  Future<AppResult<EmptyModel>> signUp(String email, String password, String name);
  Future<AppResult<UserProfileModel>> getProfile();
}

class AuthenticateRepositoryImpl implements AuthenticateRepository {
  late final AuthenDataSourceRemote _authenDataSourceRemote;
  AuthenticateRepositoryImpl(this._authenDataSourceRemote);
  @override
  Future<AppResult<UserPostModel>> signIn(String email, String password) {
    return _authenDataSourceRemote.signIn(email, password);
  }

  @override
  Future<AppResult<UserProfileModel>> getProfile() {
    return _authenDataSourceRemote.getProfile();
  }

  @override
  Future<AppResult<EmptyModel>> signUp(String email, String password, String name) {
    return _authenDataSourceRemote.signUp(email, password, name);
  }
}
