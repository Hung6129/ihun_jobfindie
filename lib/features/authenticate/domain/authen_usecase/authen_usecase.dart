import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/configuration/domain/models/empty_model.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_profile_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';

abstract class AuthenUseCase {
  Future<AppResult<UserPostModel>> signIn(String email, String password);

  Future<AppResult<EmptyModel>> signUp(String email, String password, String name);

  Future<AppResult<UserProfileModel>> getProfile();

  Future<AppResult<EmptyModel>> checkTokenIsExpired(String token);

  Future<void> logout();
}

class AuthenUseCaseImpl implements AuthenUseCase {
  late final AuthenticateRepository _authenticateRepository;
  AuthenUseCaseImpl(this._authenticateRepository);
  Future<AppResult<UserPostModel>> signIn(String email, String password) {
    return _authenticateRepository.signIn(email, password);
  }

  @override
  Future<AppResult<UserProfileModel>> getProfile() {
    return _authenticateRepository.getProfile();
  }

  @override
  Future<AppResult<EmptyModel>> signUp(String email, String password, String name) {
    return _authenticateRepository.signUp(email, password, name);
  }

  @override
  Future<AppResult<EmptyModel>> checkTokenIsExpired(String token) {
    return _authenticateRepository.checkTokenIsExpired(token);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
