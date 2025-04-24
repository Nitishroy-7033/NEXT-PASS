import '../../../../core/constants/app_linker.dart';

class PasswordCategorySection extends StatelessWidget {
  const PasswordCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryContainer(
              icon: IconsAssets.androidIcon,
              title: "App",
              color: AppColors.blueColor,
              onTap: () {},
            ),
            CategoryContainer(
              icon: IconsAssets.browserIcon,
              title: "Website",
              color: AppColors.yellowColor,
              onTap: () {},
            ),
            CategoryContainer(
              icon: IconsAssets.paymentIcon,
              title: "Payment",
              color: AppColors.greenColor,
              onTap: () {},
            ),
            CategoryContainer(
              icon: IconsAssets.paymentIcon,
              title: "Others",
              color: Theme.of(context).colorScheme.onSurface,
              onTap: () {},
            ),
            // Obx(
            //   () => CategoryContainer(
            //     icon: (homeScreenController.isMoreTabOpen.value)
            //         ? IconsAssets.dropUpIcon
            //         : IconsAssets.moreDotIcon,
            //     title: (homeScreenController.isMoreTabOpen.value)
            //         ? "Hide"
            //         : "More",
            //     color: Theme.of(context).colorScheme.onSurface,
            //     onTap: () {
            //       homeScreenController.runMoreTab();
            //     },
            //   ),
            // ),
          ],
        ),
        // Obx(
        //   () => (homeScreenController.isMoreTabOpen.value)
        //       ? Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             CategoryContainer(
        //               icon: IconsAssets.generateIcon,
        //               title: "Generate",
        //               color: AppColors.pinkColor,
        //               onTap: () {},
        //             ),
        //             CategoryContainer(
        //               icon: IconsAssets.alertIcon,
        //               title: "Pownd",
        //               color: Theme.of(context).colorScheme.error,
        //               onTap: () {},
        //             ),
        //             CategoryContainer(
        //               icon: IconsAssets.generateIcon,
        //               title: "Generate",
        //               color: AppColors.pinkColor,
        //               onTap: () {},
        //             ),
        //             CategoryContainer(
        //               icon: IconsAssets.alertIcon,
        //               title: "Pownd",
        //               color: Theme.of(context).colorScheme.error,
        //               onTap: () {},
        //             ),
        //           ],
        //         )
        //       : const SizedBox.shrink(),
        // ),
      ],
    );
  }
}
