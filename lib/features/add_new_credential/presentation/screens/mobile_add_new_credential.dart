import 'package:next_pass/core/constants/app_linker.dart';

class MobileAddNewCredential extends StatelessWidget {
  final controller = Get.put(AddNewCredentialController());
   MobileAddNewCredential({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.newCredentialTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 35),
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                AppStrings.changeIconNC,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const AddNewCredentialForm(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
