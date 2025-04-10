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
                "title": credential.title,
                "siteUrl": credential.siteUrl,
                "userName": credential.username,
                "email": credential.emailId,
                "password": credential.password,
              });
            },
            child: AccountContainerTile(
              title: credential.title,
              emailId: credential.emailId,
              password: credential.password, // '********',
              strength: passwordController
                  .checkandReturnPasswordStrength(credential.password),
              imageUrl: credential.siteUrl,
              isAlert: int.tryParse(credential.passwordStrength) != null
                  ? int.parse(credential.passwordStrength) < 3
                  : false,
              ontap: () {},
            ),
          );
        },
      );
    });
  }
}
