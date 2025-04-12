import '../../../core/constants/app_linker.dart';

abstract interface class ProfileInterface {
  Future<ApiResponse<ProfileModel>> GetProfileInfo();
}
