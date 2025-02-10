import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/routes/app_routes.dart';
import 'package:next_pass/features/home/presentation/widgets/account_container_tile.dart';
import 'package:next_pass/features/home/presentation/widgets/category_container.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController homeSearchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: [
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
                    width: 10,
                  ),
                  Text('Rose Poole',
                      style: Theme.of(context).textTheme.headlineLarge),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.authtab);
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: false,
                controller: homeSearchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
                  constraints: const BoxConstraints(
                    maxHeight: 40,
                  ),
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
          toolbarHeight: 95,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        // Floation Action Button for Add new password
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primary,
          heroTag: null,
          tooltip: "Add Password",
          child: SvgPicture.asset(
            IconsAssets.addIcon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.surface,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryContainer(
                      icon: IconsAssets.browserIcon,
                      title: "Browser",
                      count: "20",
                      onTap: () {},
                    ),
                    CategoryContainer(
                      icon: IconsAssets.mobileIcon,
                      title: "Mobile",
                      count: "13",
                      onTap: () {},
                    ),
                    CategoryContainer(
                      icon: IconsAssets.paymentCardIcon,
                      title: "Payment",
                      count: "05",
                      onTap: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Latest Account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Column(
                  children: [
                    AccountContainerTile(
                      title: "Spotify",
                      subTitle: "rosepoole@email.com",
                      imageUrl: IconsAssets.spotifyLogoUrl,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Netflix",
                      subTitle: "rosepoole@email.com",
                      imageUrl: IconsAssets.netflixLogoUrl,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Instagram",
                      subTitle: "rosepoole@email.com",
                      imageUrl: IconsAssets.instagramLogoUrl,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Slack",
                      subTitle: "rosepoole@email.com",
                      imageUrl: IconsAssets.slackLogoUrl,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "Discord",
                      subTitle: "rosepoole@email.com",
                      imageUrl: IconsAssets.discordLogoUrl,
                      ontap: () {},
                    ),
                    AccountContainerTile(
                      title: "GitHub",
                      subTitle: "rosepoole@email.com",
                      imageUrl: IconsAssets.githubLogoUrl,
                      ontap: () {},
                    ),
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
