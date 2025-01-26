import '../entities/user.dart';
import '../repository/auth_repository.dart';


class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> execute(String email, String password) {
    return repository.login(email, password);
  }
}
