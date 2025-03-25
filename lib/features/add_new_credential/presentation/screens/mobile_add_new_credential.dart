import '../../../../core/constants/app_linker.dart';

class MobileAddNewCredential extends StatelessWidget {
  final controller = Get.put(AddNewCredentialController());

  MobileAddNewCredential({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.newCredentialTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100, 
                  height: 100, 
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Obx(() {
                    final url = controller.siteUrl.value;
                    if (url.isNotEmpty) {
                      return Image.network(
                        "https://www.google.com/s2/favicons?sz=128&domain=$url", // Increased favicon size
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.language,
                              size: 48, // Increased icon size
                              color: Colors.grey);
                        },
                      );
                    } else {
                      return const Icon(Icons.language,
                          size: 48, // Increased icon size
                          color: Colors.grey);
                    }
                  }),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                AppStrings.changeIconNC,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: 30),
            const AddNewCredentialForm(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
