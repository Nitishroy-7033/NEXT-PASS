import 'package:next_pass/core/constants/app_linker.dart';

class AllCredentialsSection extends StatelessWidget {
  final HomeScreenController controller = Get.find();

  AllCredentialsSection({super.key}); // ✅ Controller injected

  @override
  Widget build(BuildContext context) {
    // Get.put(CredentialController());
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
              // print("hi this is testing");
              // Get.toNamed(AppRoutes.appCredentials);
              Get.to(() => AppCredentials(), arguments: {
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
              password: '********',
              strength: _getPasswordStrengthLabel(credential.passwordStrength),
              imageUrl: _getImageUrl(credential.siteUrl),
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

  /// **Convert Password Strength to Label**
  String _getPasswordStrengthLabel(String strength) {
    switch (strength.toLowerCase().trim()) {
      // ✅ Ensure case-insensitivity & remove extra spaces
      case "strong":
        return "Strong";
      case "medium":
        return "Medium";
      case "weak":
        return "Weak";
      default:
        return "Unknown"; // ✅ For debugging
    }
  }

  /// **Get Image Based on URL**
  String _getImageUrl(String siteUrl) {
    if (siteUrl.contains("facebook")) {
      return AppImageAssets.facebookLogo;
    } else if (siteUrl.contains("google")) {
      return AppImageAssets.googleLogo;
    } else if (siteUrl.contains("twitter")) {
      return AppImageAssets.twitterLogo;
    } else if (siteUrl.contains("linkedin")) {
      return AppImageAssets.linkedinLogo;
    } else if (siteUrl.contains("playstore")) {
      return AppImageAssets.playstoreLogo;
    } else {
      return AppImageAssets.appLogo; // ✅ Default image if no match
    }
  }
}
