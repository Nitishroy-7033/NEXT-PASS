import '../../../../core/constants/app_linker.dart';

class ReenterMasterPinWidget extends StatelessWidget {
  final MasterPasswordController pinController = Get.find();
  ReenterMasterPinWidget({Key? key}) : super(key: key); // ✅ Add key

  @override
  Widget build(BuildContext context) {
    return Text(
      "Re-enter Master PIN",
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
    );
  }
}
