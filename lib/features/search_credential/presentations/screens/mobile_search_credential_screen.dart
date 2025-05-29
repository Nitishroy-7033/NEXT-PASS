import '../../../../../core/constants/app_linker.dart';

class MobileSearchCredentialScreen extends StatelessWidget {
  const MobileSearchCredentialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchCredentialController searchCredentialController =
        Get.put(SearchCredentialController());
    final HomeScreenController homeController = Get.find();
    final PasswordController passwordController = Get.put(PasswordController());

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            searchCredentialController.selectedCategory.value = "";
            Get.back();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text(
          "Search Credential",
        ),
        scrolledUnderElevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 12.h),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                onChanged: (value) => searchCredentialController.search(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5.h, right: 5.w),
                  constraints: BoxConstraints(
                    maxHeight: 43.h,
                  ),
                  hintText: AppStrings.searchText,
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.w),
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
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                maxLines: 1,
                cursorColor: Theme.of(context).colorScheme.onSurface,
                cursorWidth: 1.5.w,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 12.h,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OptionContainer(
                      label: "App",
                      isSelected:
                          searchCredentialController.selectedCategory.value ==
                              "App",
                      onTap: () =>
                          searchCredentialController.selectCategory("App"),
                    ),
                    OptionContainer(
                      label: "Website",
                      isSelected:
                          searchCredentialController.selectedCategory.value ==
                              "Website",
                      onTap: () =>
                          searchCredentialController.selectCategory("Website"),
                    ),
                    OptionContainer(
                      label: "Payment",
                      isSelected:
                          searchCredentialController.selectedCategory.value ==
                              "Payment",
                      onTap: () =>
                          searchCredentialController.selectCategory("Payment"),
                    ),
                    OptionContainer(
                      label: "Other",
                      isSelected:
                          searchCredentialController.selectedCategory.value ==
                              "Other",
                      onTap: () =>
                          searchCredentialController.selectCategory("Other"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Expanded(
                child: Obx(
                  () {
                    final query = searchCredentialController.searchQuery.value;
                    final category =
                        searchCredentialController.selectedCategory.value;
                    final results = query.isEmpty && category.isEmpty
                        ? homeController.credentials
                        : searchCredentialController.searchResults;

                    if (results.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'No Credential Found${query.isNotEmpty ? '\nfor "$query"' : category.isNotEmpty ? '\nin "$category"' : ''}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: 17.sp,
                                ),
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          FocusScope.of(context).unfocus();
                          return false;
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.h),
                          itemCount: results.length,
                          itemBuilder: (context, index) {
                            final credential = results[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => const AppCredentials(),
                                    arguments: {
                                      "credential": credential,
                                    });
                              },
                              child: AccountContainerTile(
                                title: credential.title ?? "Not Found",
                                emailId: credential.emailId ?? "Not Found",
                                password: "**********",
                                strength: passwordController
                                    .checkandReturnPasswordStrength(
                                        credential.password ?? "Not Found"),
                                imageUrl: credential.siteUrl ?? "",
                                isAlert: int.tryParse(
                                            credential.passwordStrength ??
                                                "") !=
                                        null
                                    ? int.parse(
                                            credential.passwordStrength ?? "") <
                                        3
                                    : false,
                                ontap: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
