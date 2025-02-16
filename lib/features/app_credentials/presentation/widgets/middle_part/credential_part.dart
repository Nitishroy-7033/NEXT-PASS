import 'package:next_pass/core/constants/app_linker.dart';

class CredentialWidget extends StatelessWidget {
  final bool isEditing;

  const CredentialWidget({super.key, required this.isEditing});

  @override
  Widget build(BuildContext context) {
    final CredentialController controller = Get.find<CredentialController>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: "Title",
            controller: controller.titleController,
            icon: Icons.language,
            isEditable: controller.isEditing.value,
          ),
          CustomTextField(
            label: "Site URL",
            controller: controller.siteUrlController,
            isEditable: controller.isEditing.value,
            icon: Icons.public,
          ),
          CustomTextField(
            label: "Username",
            controller: controller.usernameController,
            isEditable: controller.isEditing.value,
            icon: Icons.person,
          ),
          CustomTextField(
            label: "Email",
            controller: controller.emailController,
            isEditable: controller.isEditing.value,
            icon: Icons.email,
          ),
          PasswordField(
              passwordController: controller.passwordController,
              controller: controller)
        ],
      ),
    );
  }
}
