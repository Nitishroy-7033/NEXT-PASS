import '../../../core/constants/app_linker.dart';

abstract interface class ProfileInterface {
  Future<ApiResponse<ProfileModel>> GetProfileInfo();
  // Profile information fetch by API Calling
}
