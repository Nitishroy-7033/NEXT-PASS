import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/core/utils/messages.dart';
import 'package:next_pass/features/database%20setup/data/database_setup_repository.dart';

class SelectDatabaseController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final DatabaseSetupRepository databaseSetupRepository =
      Get.put(DatabaseSetupRepository()); // ✅ Injected
  final ApiClient apiClient = Get.find<ApiClient>();

  var isLoading = false.obs;
  var isError = false.obs;
  var errorMessage = "".obs;

  TextEditingController databaseURLController = TextEditingController();

  Future<void> chooseDataBase() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = "";

    if (selectedIndex.value == 0) {
      try {
        final response = await databaseSetupRepository.selectNextPassDB(
          "NEXT_PASS",
        );

        if (response.success == true && response.data != null) {
          // apiClient.setUserDetails(response.data!);
          SuccessMessage(response.message ?? "Next-Pass Database Selected");
          Get.offAllNamed(AppRoutes.home);
        } else {
          print(response);
          print(response.message);
          _handleError(response.message);
        }
      } catch (e) {
        print("Error ${e}");
        _handleError(e);
      } finally {
        isLoading.value = false;
      }
    } else {
      if (databaseURLController.text.trim().isEmpty) {
        isLoading.value = false;
        isError.value = true;
        errorMessage.value = "Please Enter Valid Database String";
        ErrorMessage(errorMessage.value);
      }
      try {
        final response = await databaseSetupRepository.selectUserDB(
          databaseURLController.text,
          "USER",
        );
        if (response.success == true && response.data != null) {
          // apiClient.setUserDetails(response.data!);
          SuccessMessage(response.message ?? "Your Database Selected");
          Get.offAllNamed(AppRoutes.home);
        } else {
          _handleError(response.message);
        }
      } catch (e) {
        print("Error ${e}");
        _handleError(e);
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _handleError(dynamic response) {
    isError.value = true;
    errorMessage.value = "ERROR come";
    print(response);
    ErrorMessage(errorMessage.value);
  }
}
