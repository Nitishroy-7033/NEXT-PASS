import '../../../../core/constants/app_linker.dart';

class AllCredentialsSection extends StatelessWidget {
  final HomeScreenController controller = Get.find();

  AllCredentialsSection({super.key}); // ✅ Controller injected

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.put(PasswordController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator()); // ✅ Loading State
      }

      if (controller.isError.value) {
        return Center(
            child: Text(controller.errorMessage.value)); // ✅ Error State
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.credentials.length,
        itemBuilder: (context, index) {
          final credential = controller.credentials[index];

          print(
              "Password Strength for ${credential.title}: ${credential.passwordStrength}");
          print("Raw Strength Value: '${credential.passwordStrength}'");
          return GestureDetector(
            onTap: () {
              Get.to(() => const AppCredentials(), arguments: {
                "credential": credential, // full model pass kar rahe
              });
            },
            child: AccountContainerTile(
              title: credential.title ?? "Not Found",
              emailId: credential.emailId ?? "Not Found",
              password:
                  "**********", // credential.password ?? "Not Found", // '********',
              strength: passwordController.checkandReturnPasswordStrength(
                  credential.password ?? "Not Found"),
              imageUrl: credential.siteUrl ?? "",
              isAlert: int.tryParse(credential.passwordStrength ?? "") != null
                  ? int.parse(credential.passwordStrength ?? "") < 3
                  : false,
              ontap: () {},
            ),
          );
        },
      );
    });
  }
}
