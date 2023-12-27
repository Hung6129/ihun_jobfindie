import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/authenticate/data/datasource/authen_datasource_remote.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';

abstract class AuthenticateRepository {
  Future<AppResult<UserPostModel>> signIn(String email, String password);
}

class AuthenticateRepositoryImpl implements AuthenticateRepository {
  late final AuthenDataSourceRemote _authenDataSourceRemote;
  AuthenticateRepositoryImpl(this._authenDataSourceRemote);
  @override
  Future<AppResult<UserPostModel>> signIn(String email, String password) {
    return _authenDataSourceRemote.signIn(email, password);
  }
}
