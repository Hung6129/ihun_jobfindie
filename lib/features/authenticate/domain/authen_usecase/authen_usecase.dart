import 'package:ihun_jobfindie/configuration/data/network/nets/app_result.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';
import 'package:ihun_jobfindie/features/authenticate/domain/repository/authen_repository.dart';

abstract class AuthenUseCase {
  Future<AppResult<UserPostModel>> signIn(String email, String password);
}

class AuthenUseCaseImpl implements AuthenUseCase {
  late final AuthenticateRepository _authenticateRepository;
  AuthenUseCaseImpl(this._authenticateRepository);
  Future<AppResult<UserPostModel>> signIn(String email, String password) {
    return _authenticateRepository.signIn(email, password);
  }
}
