import 'package:next_pass/core/constants/app_linker.dart';

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
                  ViewProfileSection(
                    profileImageURL:
                        "https://writestylesonline.com/wp-content/uploads/2018/11/Three-Statistics-That-Will-Make-You-Rethink-Your-Professional-Profile-Picture.jpg",
                    userName: "Harsh Kumar Gupta",
                    onTap: () {
                      Get.toNamed(AppRoutes.profilePage);
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      print(
                          "Notification button clicked!"); // ✅ Fixed: Removed logout call
                    },
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      padding: EdgeInsets.all(7.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10.r),
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
              SizedBox(height: 12.h),
              const SearchBarSection(),
            ],
          ),
          scrolledUnderElevation: 0.0,
          toolbarHeight: 120.h,
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
  padding: EdgeInsets.symmetric(horizontal: 16.w),
  child: Obx(() {
    if (homeController.isLoading.value) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: const Center(
          child: CircularProgressIndicator(), // ✅ Fully centered loader
        ),
      );
    }

    if (homeController.isError.value) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeController.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  homeController.fetchCredentials(); // ✅ Retry
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      );
    }

    if (homeController.credentials.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 60, color: Colors.grey),
              SizedBox(height: 10),
              Text(
                "No credentials found",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // ✅ Main UI when data is available
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PasswordCategorySection(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              children: [
                Text(
                  AppStrings.allCredentials,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    print('View All button Clickedddd');
                  },
                  splashColor: Colors.transparent,
                  child: Text(
                    AppStrings.viewAll,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
          AllCredentialsSection(), // ✅ Show actual credentials
        ],
      ),
    );
  }),
),


       
      
    
      ),
    );
  } 
}
