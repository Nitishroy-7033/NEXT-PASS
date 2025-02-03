import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/primary_button.dart';
import 'package:next_pass/core/widgets/sidebar%20for%20web/sidebar_tab.dart';
import 'package:next_pass/features/home/widgets/account_container_tile.dart';
import 'package:next_pass/features/home/widgets/category_container.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Row(
        children: [
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "NEXT-PASS",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PrimaryButton(
                    text: "Add Password",
                    icon: IconsAssets.addIcon,
                    onPressed: () {},
                  ),
                ),
                SidebarTab(),
              ],
            ),
          )),
          // LEFT LAYOUT AREA
          Expanded(
            flex: 6,
            child: Column(
              children: [
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
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
