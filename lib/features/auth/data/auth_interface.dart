import '../../../core/constants/api_response.dart';
import '../models/auth_model.dart';

abstract interface class AuthInterface {
  Future<ApiResponse<AuthModel>> createAnAccount(
      String email, String pwd, String firstName, String lastName);
  Future<ApiResponse<AuthModel>> login(String email, String password);
}
