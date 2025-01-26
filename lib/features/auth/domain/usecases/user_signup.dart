import '../entities/user.dart';
import '../repository/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<User> execute(String name, String email, String password) {
    return repository.signup(name, email, password);
  }
}
