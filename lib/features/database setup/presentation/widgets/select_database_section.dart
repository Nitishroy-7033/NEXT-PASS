import 'package:next_pass/core/constants/app_linker.dart';

class SelectDatabaseSection extends StatelessWidget {
  const SelectDatabaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectDatabaseController selectDatabaseController =
        Get.put(SelectDatabaseController());
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlanCardDatabase(
            imagePath: IconsAssets.nextPassDBIcon,
            isSelected: selectDatabaseController.selectedIndex.value == 0,
            onTap: () {
              selectDatabaseController.selectedIndex.value = 0;
            },
          ),
          PlanCardDatabase(
            imagePath: IconsAssets.myOwnDBIcon,
            isSelected: selectDatabaseController.selectedIndex.value == 1,
            onTap: () {
              selectDatabaseController.selectedIndex.value = 1;
            },
          ),
        ],
      ),
    );
  }
}
