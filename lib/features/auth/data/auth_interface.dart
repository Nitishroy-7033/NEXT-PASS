import '../../../core/constants/app_linker.dart';

abstract interface class AuthInterface {
  Future<ApiResponse<AuthModel>> createAnAccount(String email, String password, String firstName, String lastName);
  Future<ApiResponse<AuthModel>> login(String email, String password);
}
