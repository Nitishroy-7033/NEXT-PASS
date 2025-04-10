import '../../../core/constants/app_linker.dart';

abstract interface class HomeInterface {
  Future<ApiResponse<List<HomeModel>>> getCredentials();
}