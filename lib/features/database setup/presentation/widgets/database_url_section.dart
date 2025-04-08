import '../../../../core/constants/app_linker.dart';

class DatabaseUrlSection extends StatelessWidget {
  const DatabaseUrlSection({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectDatabaseController selectDatabaseController =
        Get.put(SelectDatabaseController());

    return Obx(
      () => (selectDatabaseController.selectedIndex.value == 0)
          ? Column(
              children: [
                SizedBox(height: 65.h),
                Text(
                  AppStrings.nextpassDatabaseDS,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 71.5.h),
              ],
            )
          : Column(
              children: [
                SizedBox(height: 44.h),
                Text(
                  AppStrings.myOwnDatabaseDS,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                TextFormField(
                  controller: selectDatabaseController.databaseURLController,
                  style: TextStyle(height: 2.h),
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(IconsAssets.mongoDBIcon),
                    ),
                    hintText: AppStrings.ownDatabaseHintTextDS,
                  ),
                ),
                SizedBox(height: 12.h),
                Text.rich(
                  TextSpan(
                      text: AppStrings.howToGetConnectionDS,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: 11.sp),
                      children: [
                        TextSpan(
                          text: AppStrings.clickHereDS,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 11.sp,
                              ),
                        ),
                      ]),
                ),
              ],
            ),
    );
  }
}
