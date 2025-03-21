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
                const SizedBox(height: 40),
                Text(
                  AppStrings.nextpassDatabaseDS,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45),
              ],
            )
          : Column(
              children: [
                Text(
                  AppStrings.myOwnDatabaseDS,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: selectDatabaseController.databaseURLController,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(IconsAssets.mongoDBIcon),
                    ),
                    hintText: AppStrings.ownDatabaseHintTextDS,
                  ),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                      text: AppStrings.howToGetConnectionDS,
                      style: Theme.of(context).textTheme.labelSmall,
                      children: [
                        TextSpan(
                          text: AppStrings.clickHereDS,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ]),
                ),
              ],
            ),
    );
  }
}
