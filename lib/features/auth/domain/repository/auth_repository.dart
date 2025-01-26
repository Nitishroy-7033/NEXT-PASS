import '../entities/user.dart';

abstract interface class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> signup(String name, String email, String password);
}
