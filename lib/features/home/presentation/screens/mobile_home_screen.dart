import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/auth/controllers/auth_controller.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final HomeScreenController homeController =
        Get.put(HomeScreenController()); // ✅ HomeScreenController injected

    // ✅ Fetch credentials when screen loads
    homeController.fetchCredentials();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

        // ✅ APP BAR
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: [
                  const ViewProfileSection(),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      authController.logOut();
                      Get.toNamed(AppRoutes.login);
                      print(
                          "Notification button clicked!"); // ✅ Fixed: Removed logout call
                    },
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
              const SizedBox(height: 12),
              const SearchBarSection(),
            ],
          ),
          scrolledUnderElevation: 0.0,
          toolbarHeight: 120,
          backgroundColor: Theme.of(context).colorScheme.surface,
          automaticallyImplyLeading: false,
        ),

        // ✅ Floating Action Button for Adding New Password
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.newCredential);
          },
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

        // ✅ Body with Credentials List
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PASSWORD CATEGORY SECTION
                const PasswordCategorySection(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.allCredentials,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          authController.logOut();
                          print('View All button Clickedddd');
                        },
                        splashColor: Colors.transparent,
                        child: Text(
                          AppStrings.viewAll,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ✅ Updated AllCredentialsSection with Loading & Error State
                Obx(() {
                  if (homeController.isLoading.value) {
                    return const Center(
                        child: CircularProgressIndicator()); // ✅ Show loader
                  }

                  if (homeController.isError.value) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            homeController.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              homeController
                                  .fetchCredentials(); // ✅ Retry API call
                            },
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  if (homeController.credentials.isEmpty) {
                    return const Center(
                      child: Text(
                        "No credentials found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return AllCredentialsSection(); // ✅ Show credentials if available
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}