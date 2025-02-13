
import 'package:next_pass/core/constants/app_linker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/constants/app_strings.dart';
import 'package:next_pass/core/routes/app_routes.dart';
import 'package:next_pass/features/home/controllers/home_screen_controller.dart';
import 'package:next_pass/features/home/presentation/widgets/account_container_tile.dart';
import 'package:next_pass/features/home/presentation/widgets/category_container.dart';


class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  /// Method for BottomSheet
  void showPasswordBottomSheet() {
    Get.bottomSheet(
      GeneratePasswordBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController homeSearchController = TextEditingController();
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                AppImageAssets.demoProfileImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rose Poole',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.viewLink,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 10,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        IconsAssets.notificationIcon,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.tertiary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                autofocus: false,
                controller: homeSearchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
                  constraints: const BoxConstraints(
                    maxHeight: 40,
                  ),
                  hintText: AppStrings.searchText,
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      IconsAssets.searchIcon,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.tertiary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                maxLines: 1,
                cursorColor: Theme.of(context).colorScheme.onSurface,
                cursorWidth: 1.5,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          scrolledUnderElevation: 0.0,
          toolbarHeight: 120,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        // Floation Action Button for Add new password
        floatingActionButton: FloatingActionButton(
          onPressed: showPasswordBottomSheet,
          backgroundColor: Theme.of(context).colorScheme.primary,
          heroTag: null,
          tooltip: AppStrings.addPassword,
          child: SvgPicture.asset(
            IconsAssets.addIcon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
        // Body
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        Obx(
                          () => CategoryContainer(
                            icon: (homeScreenController.isMoreTabOpen.value)
                                ? IconsAssets.dropUpIcon
                                : IconsAssets.moreDotIcon,
                            title:
                                (homeScreenController.isMoreTabOpen.value)
                                    ? "Hide"
                                    : "More",
                            color: Theme.of(context).colorScheme.onSurface,
                            onTap: () {
                              homeScreenController.runMoreTab();
                            },
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => (homeScreenController.isMoreTabOpen.value)
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryContainer(
                                  icon: IconsAssets.generateIcon,
                                  title: "Generate",
                                  color: AppColors.pinkColor,
                                  onTap: () {},
                                ),
                                CategoryContainer(
                                  icon: IconsAssets.alertIcon,
                                  title: "Pownd",
                                  color:
                                      Theme.of(context).colorScheme.error,
                                  onTap: () {},
                                ),
                                CategoryContainer(
                                  icon: IconsAssets.generateIcon,
                                  title: "Generate",
                                  color: AppColors.pinkColor,
                                  onTap: () {},
                                ),
                                CategoryContainer(
                                  icon: IconsAssets.alertIcon,
                                  title: "Pownd",
                                  color:
                                      Theme.of(context).colorScheme.error,
                                  onTap: () {},
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.allCredentials,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      Text(
                        AppStrings.viewAll,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    AccountContainerTile(
                      title: "Facebook",
                      emailId: "rosepoole@email.com",
                      imageUrl: AppImageAssets.facebookLogo,
                      password: "*********************",
                      strength: "Strong",
                      isAlert: true,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Google",
                      emailId: "rosepoole@email.com",
                      password: "*********************",
                      strength: "Weak",
                      imageUrl: AppImageAssets.googleLogo,
                      isAlert: false,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Playstore",
                      emailId: "rosepoole@email.com",
                      password: "*********************",
                      strength: "Strong",
                      imageUrl: AppImageAssets.playstoreLogo,
                      isAlert: true,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Twitter",
                      emailId: "rosepoole@email.com",
                      password: "*********************",
                      strength: "Weak",
                      imageUrl: AppImageAssets.twitterLogo,
                      isAlert: false,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Linkedin",
                      emailId: "rosepoole@email.com",
                      password: "*********************",
                      strength: "Strong",
                      imageUrl: AppImageAssets.linkedinLogo,
                      isAlert: false,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Twitter",
                      emailId: "rosepoole@email.com",
                      password: "*********************",
                      strength: "Weak",
                      imageUrl: AppImageAssets.twitterLogo,
                      isAlert: false,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Linkedin",
                      emailId: "rosepoole@email.com",
                      password: "*********************",
                      strength: "Strong",
                      imageUrl: AppImageAssets.linkedinLogo,
                      isAlert: true,
                      ontap: () {},
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Generate Password'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
