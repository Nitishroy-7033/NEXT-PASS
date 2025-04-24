import '../../../../core/constants/app_linker.dart';

// ignore: must_be_immutable
class MobileDatabaseSetup extends StatelessWidget {
  const MobileDatabaseSetup({super.key});
  // MasterPasswordController pinController = Get.put(MasterPasswordController());
  @override
  Widget build(BuildContext context) {
    final SelectDatabaseController selectDatabaseController =
        Get.put(SelectDatabaseController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 107.h),
              Text(
                AppStrings.headingDS,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Text(
                  AppStrings.definationDS,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 44.h),
              // Select Databse Section
              const SelectDatabaseSection(),
              // Databse URL Section for Own Database
              const DatabaseUrlSection(),

              Obx(
                () => selectDatabaseController.isError.value
                    ? SizedBox(height: 5.h)
                    : SizedBox(height: 30.h),
              ),

              // Error Messages area
              Obx(
                () => selectDatabaseController.isError.value
                    ? Row(
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          SizedBox(width: 10.w),
                          Text(
                            selectDatabaseController.errorMessage.value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.red),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Obx(
                () => selectDatabaseController.isError.value
                    ? SizedBox(height: 15.h)
                    : const SizedBox.shrink(),
              ),
              // Save Button
              Obx(
                () => selectDatabaseController.isLoading.value
                    ? const CircularProgressIndicator()
                    : PrimaryButton(
                        text: AppStrings.startButton,
                        onPressed: () async {
                          // await pinController
                          //     .loadSavedPin(); // Pehle PIN load karein

                          // if (pinController.isCreatingPin.value == false) {
                          //   Get.offAllNamed(AppRoutes
                          //       .masterPassword); // PIN hai toh agla screen dikhayein
                          // }

                          selectDatabaseController.chooseDataBase();
                        },
                      ),
              ),
              SizedBox(height: 26.h),
              Text.rich(
                TextSpan(
                    text: AppStrings.ourDataProtectionDS,
                    style: Theme.of(context).textTheme.labelMedium,
                    children: [
                      TextSpan(
                        text: AppStrings.readMoreDS,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
