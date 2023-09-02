
import 'package:ihun_jobfindie/shared/models/user_model.dart';
import 'package:ihun_jobfindie/shared/typedefs/type_defs.dart';

abstract class AuthenticationRepository {
  FutureEither<UserModel> login(String email, String password);
}
