

import '../../../../core/constants/app_linker.dart';

class WebDashboard extends StatelessWidget {
  const WebDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final WebSidebarController sidebarController =
        Get.put(WebSidebarController());
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // RIGHT LAYOUT AREA
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: 0.5,
                    ),
                    bottom: BorderSide.none,
                    top: BorderSide.none,
                    left: BorderSide.none,
                  ),
                ),
                child: Column(
                  children: [
                    // APP NAME TEXT
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "NEXT-PASS",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ADD PASSWORD BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PrimaryButton(
                        text: "Add Password",
                        icon: IconsAssets.addIcon,
                        onPressed: () {},
                      ),
                    ),
                    // SIDE BAR TABS
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 16),
                      child: Obx(
                        () => Column(
                          children: [
                            SidebarTab(
                              icon: IconsAssets.homeIcon,
                              title: AppStrings.sidebarHomeTitle,
                              onTap: () => sidebarController.setIndex(0),
                              isSelected:
                                  sidebarController.selectedIndex.value == 0,
                            ),
                            SidebarTab(
                              icon: IconsAssets.securityIcon,
                              title: AppStrings.sidebarProtectionTitle,
                              onTap: () => sidebarController.setIndex(1),
                              isSelected:
                                  sidebarController.selectedIndex.value == 1,
                            ),
                            SidebarTab(
                              icon: IconsAssets.bookmarkIcon,
                              title: AppStrings.sidebarBookmarkTitle,
                              onTap: () => sidebarController.setIndex(2),
                              isSelected:
                                  sidebarController.selectedIndex.value == 2,
                            ),
                            SidebarTab(
                              icon: IconsAssets.personProfileIcon,
                              title: AppStrings.sidebarAccountTitle,
                              onTap: () => sidebarController.setIndex(3),
                              isSelected:
                                  sidebarController.selectedIndex.value == 3,
                            ),
                            SidebarTab(
                              icon: IconsAssets.settingsIcon,
                              title: AppStrings.sidebarSettingsTitle,
                              onTap: () => sidebarController.setIndex(4),
                              isSelected:
                                  sidebarController.selectedIndex.value == 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // LEFT LAYOUT AREA
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // APP BAR FOR WEB , FOR ALL SCREENS (COMMON)
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 0.5,
                        ),
                        right: BorderSide.none,
                        top: BorderSide.none,
                        left: BorderSide.none,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 5, right: 5),
                            constraints: const BoxConstraints(
                                maxHeight: 40, maxWidth: 300),
                            hintText: "search your vaults",
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
                            fillColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
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
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                IconsAssets.notificationIcon,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onSurface,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImageAssets.demoProfileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  // SCREENS VIEW FOR DIFFERENT TABS
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => sidebarController.getWebScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
