import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/custom_text_field.dart';
import 'package:next_pass/features/home/widgets/category_container.dart';
import 'package:next_pass/res/assets_res.dart';
import 'package:next_pass/res/font_res.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController homeSearchController = TextEditingController();
    TextEditingController controller = TextEditingController();
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
                        AssetsRes.DEMO_PROFILE_IMAGE,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Rose Poole',
                    style: TextStyle(
                      fontFamily: FontRes.MONTSERRAT_SEMIBOLD,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: false,
                controller: homeSearchController,
                decoration: InputDecoration(
                  // isDense: true,

                  contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
                  constraints: const BoxConstraints(
                    maxHeight: 40,
                  ),
                  hintText: "search your vaults",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontRes.MONTSERRAT_REGULAR,
                  ),
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
                cursorColor: Theme.of(context).colorScheme.onPrimary,
                cursorWidth: 1.5,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: FontRes.MONTSERRAT_REGULAR,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          toolbarHeight: 130,
          // backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category',
                style: TextStyle(
                  fontFamily: FontRes.MONTSERRAT_SEMIBOLD,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                // spacing: 14,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryContainer(
                    icon: IconsAssets.browserIcon,
                    title: "Browser",
                    count: "20",
                  ),
                  CategoryContainer(
                    icon: IconsAssets.mobileIcon,
                    title: "Mobile",
                    count: "13",
                  ),
                  CategoryContainer(
                    icon: IconsAssets.paymentCardIcon,
                    title: "Payment",
                    count: "05",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // CustomTextField(hintText: 'hintText', controller: controller)
              // CustomTextField(
              //     hintText: 'Enter Your Full Name',
              //     controller: homeSearchController),
              CustomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
