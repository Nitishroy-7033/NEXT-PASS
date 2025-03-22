import 'package:next_pass/core/constants/api_response.dart';
import 'package:next_pass/features/home/model/home_model.dart';

abstract interface class HomeInterface {
  Future<ApiResponse<List<HomeModel>>> getCredentials();
}