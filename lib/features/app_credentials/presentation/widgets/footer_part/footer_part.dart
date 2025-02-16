import 'package:next_pass/core/constants/app_linker.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CredentialController credentialController =
        Get.put(CredentialController());

    final FooterController controller = Get.put(FooterController());

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Change Reminder & Category
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppStrings.changeReminder,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              AppStrings.category,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRow(Icons.timer, "30 Days"),
              _buildRow(Icons.web, "Website"),
            ],
          ),
          const SizedBox(height: 15),

          // Shared With Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.sharedWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
           GestureDetector(
  onTap: () {
    if (credentialController.isEditing.value) {
      credentialController.saveEditedCredentials(); // Save and update UI
    }
    credentialController.toggleEditing(); // Toggle edit mode
  },
  child: Obx(() => Row(
        children: [
          Text(
            credentialController.isEditing.value
                ? AppStrings.save // Show "Save" text when editing
                : AppStrings.edit, // Show "Edit" text otherwise
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(width: 5),
          Icon(
            credentialController.isEditing.value ? Icons.check : Icons.edit,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: 16,
          ),
        ],
      )),
)

            ],
          ),

          const SizedBox(height: 10), // User Icons Placeholder (Square Avatars)
          Row(
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 32, // Square size (same as radius * 2)
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius:
                        BorderRadius.circular(6), // Rounded square look
                  ),
                ),
              ),
            )..add(
                // Add User Icon (Square)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius:
                        BorderRadius.circular(6), // Adjust for square shape
                  ),
                  child:
                      const Icon(Icons.person, color: Colors.white, size: 20),
                ),
              ),
          ),

          const SizedBox(height: 16),

          // Edit & Delete Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Edit Button
              Expanded(
                child: ElevatedButton(
                  onPressed: controller.onEditPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(AppStrings.edit,
                      style: TextStyle(
                          fontSize: 15, color: AppColors.backgroundLight)),
                ),
              ),

              const SizedBox(width: 10),

              // Delete Button
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightred, width: 1),
                  color: AppColors.error.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: controller.onDeletePressed,
                  icon: SvgPicture.asset(
                    IconsAssets.delete_icon,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        AppColors.lightred, BlendMode.srcIn),
                  ),
                  padding: const EdgeInsets.all(12),
                  constraints: const BoxConstraints(),
                  splashRadius: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon,
            color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
            size: 18),
        const SizedBox(width: 6),
        Text(text,
            style: TextStyle(
                color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                fontSize: 14)),
      ],
    );
  }
}
