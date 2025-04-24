import '../../../core/constants/app_linker.dart';

class FooterController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final CredentialController credentialController = Get.find();

  void onEditPressed() {
    print("Edit button clicked");
  }

  void onDeletePressed() {
    print("Delete button clicked");
  }

// Invite User Function
  void onInviteUser() async {
    emailController.clear(); // Clear previous input

    final result = await Get.dialog<bool>(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.inviteUser,
                  style: Get.textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: AppStrings.emailt,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterEmail;
                    }
                    if (!value.isEmail) {
                      return AppStrings.enterValidEmail;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      child: Text(AppStrings.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.back(result: true);
                        }
                      },
                      child: Text(AppStrings.invite),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (result == true && emailController.text.isNotEmpty) {
      try {
        SuccessMessage(AppStrings.inviteSuccess);
      } catch (e) {
        ErrorMessage(AppStrings.inviteError);
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void deleteCredentialPopUP(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text(
            AppStrings.deleteCredential,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              credentialController.titleController.text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20.h),
            Text(
              "Are you sure to delete this credential",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        titlePadding: EdgeInsets.symmetric(vertical: 20.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actionsPadding: EdgeInsets.symmetric(vertical: 10.h),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              AppStrings.cancel,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          TextButton(
            onPressed: credentialController.deleteCredential,
            child: Text(
              AppStrings.delete,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
