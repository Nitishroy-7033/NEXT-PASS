import '../../../../../core/constants/app_linker.dart';

class AppCredentials extends StatelessWidget {
  const AppCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    final CredentialController controller = Get.put(CredentialController());

    return Scaffold(
      appBar: CustomAppBar(
        title: "Credential Details",
        actionIcon: Obx(() => IconButton(
              icon: SvgPicture.asset(
                controller.isEditing.value
                    ? IconsAssets.check_icon
                    : IconsAssets.edit_icon,
                width: 20.w,
                height: 20.w,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimaryContainer,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                if (controller.isEditing.value) {
                  controller.saveEditedCredentials(); // Save and update UI
                }
                controller.toggleEditing(); // Toggle edit mode
              },
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36.h),
            CredentialIconPreview(
              credentialIconURL: controller.siteUrlController.text,
            ),

            //  Wrap CredentialWidget with Obx() for real-time updates
            Obx(
              () => CredentialDataWidget(
                isEditing: controller.isEditing.value,
                title: controller.titleController,
                siteURL: controller.siteUrlController,
                userName: controller.usernameController,
                email: controller.emailController,
                password: controller.passwordController,
                controller: controller,
              ),
            ),
            // FooterWidget(
            //   passwordChangeReminder: controller.passwordChangeReminder!,
            //   passwordCategory: controller.passwordCategory!,
            // ),
          ],
        ),
      ),
    );
  }
}
