import '../../../../../core/constants/app_linker.dart';

class CredentialController extends GetxController {
  var password = ''.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var isEditing = false.obs;

  // Controllers for user input
  final titleController = TextEditingController();
  final siteUrlController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  // void onInit() {
  //   super.onInit();
  //   // Initialize controllers with default values
  //   titleController.text = "Facebook";
  //   siteUrlController.text = "https://github.com";
  //   usernameController.text = "berarahul";
  //   emailController.text = "rb6764385@gmail.com";
  //   passwordController.text = "rahul009";
  // }
  void onInit() {
    super.onInit();
    var args = Get.arguments ?? {}; // Null Safety
    print("Received Arguments: $args");
    titleController.text = args["title"] ?? "";
    siteUrlController.text = args["siteUrl"] ?? "";
    usernameController.text = args["userName"] ?? "";
    emailController.text = args["email"] ?? "";
    passwordController.text = args["password"] ?? "";
  }

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

  void saveEditedCredentials() {
    // Trigger UI update
    isPasswordVisible.value = false;
    isEditing.refresh();
  }
}
