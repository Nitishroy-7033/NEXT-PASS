import 'package:next_pass/core/constants/app_linker.dart';


// ignore: non_constant_identifier_names
Future<dynamic> BottomSheetPasswordGenerator(BuildContext context) {
  return Get.bottomSheet(
    Container(
      height: 425,
      width: 396,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(child: Text(AppStrings.generatePassword)),
            const SizedBox(
              height: 20,
            ),
            // header widget
           GeneratePasswordHeaderWidget(),
            // footer widget
            GeneratePasswordFooterWidget(),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
