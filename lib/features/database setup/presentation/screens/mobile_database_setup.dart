import 'package:next_pass/core/constants/app_linker.dart';

// ignore: must_be_immutable
class MobileDatabaseSetup extends StatelessWidget {
   MobileDatabaseSetup({super.key});
MasterPasswordController pinController =
      Get.put(MasterPasswordController());
  @override
  Widget build(BuildContext context) {
    final SelectDatabaseController selectDatabaseController =
        Get.put(SelectDatabaseController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              children: [
                Text(
                  AppStrings.headingDS,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    AppStrings.definationDS,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // Select Databse Section
                const SelectDatabaseSection(),

                const SizedBox(height: 30),
                // Databse URL Section for Own Database
                const DatabaseUrlSection(),

                Obx(
                  () => selectDatabaseController.isError.value
                      ? const SizedBox(height: 15)
                      : const SizedBox(height: 30),
                ),
                // Error Messages area
                Obx(
                  () => selectDatabaseController.isError.value
                      ? Row(
                          children: [
                            const Icon(Icons.error, color: Colors.red),
                            const SizedBox(width: 10),
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
                      ? const SizedBox(height: 20)
                      : const SizedBox.shrink(),
                ),
                // Save Button
                Obx(
                  () => selectDatabaseController.isLoading.value
                      ? const CircularProgressIndicator()
                      : PrimaryButton(
                          text: AppStrings.startButton,
                        onPressed: () async {
            await pinController.loadSavedPin(); // Pehle PIN load karein

             if (pinController.isCreatingPin.value == false) {  
             Get.offAllNamed(AppRoutes.masterPassword); // PIN hai toh agla screen dikhayein
            }

        selectDatabaseController.chooseDataBase();
},

                        ),
                ),
                const SizedBox(height: 25),
                Text.rich(
                  TextSpan(
                      text: AppStrings.ourDataProtectionDS,
                      style: Theme.of(context).textTheme.labelMedium,
                      children: [
                        TextSpan(
                          text: AppStrings.readMoreDS,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
