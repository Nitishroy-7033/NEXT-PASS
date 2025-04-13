// footer_part.dart
import '../../../../../core/constants/app_linker.dart';

class FooterWidget extends StatelessWidget {
  final int passwordChangeReminder;
  final String passwordCategory;
  const FooterWidget(
      {super.key,
      required this.passwordChangeReminder,
      required this.passwordCategory});

  @override
  Widget build(BuildContext context) {
    var invitedPeopleList = [
      {
        "imageUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s",
        "email": "harshkumargupta123@gmail.com",
      },
      {
        "imageUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s",
        "email": "abhaykewat@gmail.com",
      },
      {
        "imageUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s",
        "email": "nitishroy@gmail.com",
      },
      {
        "imageUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s",
        "email": "rahulbera9876@gmail.com",
      },
      {
        "imageUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s",
        "email": "shaharyarali1234@gmail.com",
      },
    ];
    final CredentialController credentialController =
        Get.put(CredentialController());

    final FooterController footerController = Get.put(FooterController());
    final CategoryListController categoryController =
        Get.put(CategoryListController());
    final ReminderListController reminderController =
        Get.put(ReminderListController());
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
      ),
      child: Column(
        children: [
          // Change Reminder & Category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.changeReminder,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                AppStrings.category,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Obx(
            () => (credentialController.isEditing.value)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDropdown(
                        itemList: const [
                          '7 Days',
                          '15 Days',
                          '30 Days',
                          '60 Days',
                          '90 Days'
                        ],
                        controller: reminderController,
                        popupWidth: 100.w,
                        maxWidth: 130.w,
                        maxHeight: 40.h,
                      ),
                      CustomDropdown(
                        itemList: const ['Website', 'App', 'Payment', 'Other'],
                        controller: categoryController,
                        popupWidth: 100.w,
                        maxWidth: 130.w,
                        maxHeight: 40.h,
                      ),
                    ],
                  )
                : SizedBox(
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(Icons.timer, "$passwordChangeReminder Days"),
                        _buildRow(Icons.category_rounded, passwordCategory),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: 15.h),

          // Shared With Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.sharedWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              InkWell(
                onTap: () {
                  inviteEditPeopleBottomsheet(context, invitedPeopleList);
                  print("open invite & edit people bottomsheet");
                },
                child: Row(
                  children: [
                    Text(
                      AppStrings.edit,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                      size: 15.h,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          // User Icons with Invite Button
          Row(
            children: List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            )..add(
                GestureDetector(
                  onTap: footerController.onInviteUser,
                  child: Tooltip(
                    message: AppStrings.inviteUser,
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Icon(Icons.person_add,
                          color: Colors.white, size: 20.h),
                    ),
                  ),
                ),
              ),
          ),
          SizedBox(height: 20.h),

          // Edit & Delete Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Edit Button
              Expanded(
                child: Obx(
                  () => PrimaryButton(
                    text: credentialController.isEditing.value
                        ? AppStrings.buttonSave
                        : AppStrings.editButton,
                    onPressed: () {
                      if (credentialController.isEditing.value) {
                        credentialController.saveEditedCredentials();
                      }
                      credentialController.toggleEditing();
                    },
                  ),
                ),
              ),

              SizedBox(width: 16.w),
              // Delete Button
              InkWell(
                onTap: () {
                  footerController.deleteCredentialPopUP(context);
                },
                child: Container(
                  height: 50.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.error,
                      width: 1.w,
                    ),
                    color: Theme.of(context)
                        .colorScheme
                        .error
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.all(12.w),
                  child: SvgPicture.asset(
                    IconsAssets.delete_icon,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.error,
                      BlendMode.srcIn,
                    ),
                  ),
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
        Icon(
          icon,
          color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
          size: 24.h,
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: Theme.of(Get.context!).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
