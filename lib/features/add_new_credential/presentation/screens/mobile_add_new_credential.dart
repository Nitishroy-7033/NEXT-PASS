import '../../../../core/constants/app_linker.dart';

class MobileAddNewCredential extends StatelessWidget {
  final controller = Get.put(AddNewCredentialController());

  MobileAddNewCredential({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.newCredentialTitle),
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 82.w,
                  height: 82.w,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Obx(() {
                    final url = controller.siteUrl.value;
                    if (url.isNotEmpty) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          "https://www.google.com/s2/favicons?sz=128&domain=$url",
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.language,
                              size: 35.h,
                              color: Theme.of(context).colorScheme.tertiary,
                            );
                          },
                        ),
                      );
                    } else {
                      return Icon(
                        Icons.language,
                        size: 35.h,
                        color: Theme.of(context).colorScheme.tertiary,
                      );
                    }
                  }),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Center(
              child: Text(
                AppStrings.changeIconNC,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SizedBox(height: 30.h),
            const AddNewCredentialForm(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
