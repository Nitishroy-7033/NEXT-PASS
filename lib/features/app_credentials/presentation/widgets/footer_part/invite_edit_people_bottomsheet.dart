import '../../../../../core/constants/app_linker.dart';

Future<dynamic> inviteEditPeopleBottomsheet(
    BuildContext context, List<Map<String, String>> invitedPeopleList) {
  return Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Credential Shared With",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 20.h),
            // All Invited People list
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
              child: Column(
                children: invitedPeopleList.map((people) {
                  return InvitedPeopleTile(
                    invitedPeopleImageURL: people["imageUrl"].toString(),
                    invitedPeopleEmail: people["email"].toString(),
                    onCancelTap: () {},
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: AppStrings.inviteEditBottomDescription,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 11.sp,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                  children: [
                    TextSpan(
                      text: AppStrings.readmoreCredentialBotton,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 11.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ]),
            ),
            SizedBox(height: 20.h),
            PrimaryButton(
              text: AppStrings.buttonSave,
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
