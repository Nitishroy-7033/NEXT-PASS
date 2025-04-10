import '../../../core/constants/app_linker.dart';

abstract interface class DatabaseSetupInterface {
  Future<ApiResponse<AuthModel>> selectNextPassDB(String dataBaseType);
  Future<ApiResponse<AuthModel>> selectUserDB(String dataBaseURL,String dataBaseType);
}
