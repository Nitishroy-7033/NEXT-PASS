import 'package:next_pass/core/constants/app_linker.dart';


// ignore: non_constant_identifier_names
Future<dynamic> ShareCredentialBottomSheet(BuildContext context) {
  return Get.bottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    Container(
      height: 394,
      width: 393,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            // header Widget
            ShareCredentialHeaderWidget(),
            SizedBox(
              height: 20,
            ),
            // footer widget
            ShareCredentialFooterWidget(),
          ],
        ),
      ),
    ),
  );
}
