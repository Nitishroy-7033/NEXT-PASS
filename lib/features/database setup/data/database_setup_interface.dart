import 'package:next_pass/core/constants/api_response.dart';
import 'package:next_pass/features/auth/models/auth_model.dart';

abstract interface class DatabaseSetupInterface {
  Future<ApiResponse<AuthModel>> selectNextPassDB(String dataBaseType);
  Future<ApiResponse<AuthModel>> selectUserDB(String dataBaseURL,String dataBaseType);
}
