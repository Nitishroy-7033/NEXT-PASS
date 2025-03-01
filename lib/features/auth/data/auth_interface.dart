import '../../../core/constants/api_response.dart';
import '../models/auth_model.dart';

abstract interface class AuthInterface {
  Future<ApiResponse<AuthModel>> login(String email, String password) ;
  Future<ApiResponse<AuthModel>> signup(String firstName,String lastName,String email, String password);
}