import '../../../../core/constants/app_linker.dart';

class CreateMasterPinWidget extends StatelessWidget {
  final MasterPasswordController pinController = Get.find();

  CreateMasterPinWidget({Key? key}) : super(key: key); // ✅ Add key

  @override
  Widget build(BuildContext context) {
    return Text(
      "Create Master PIN",
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
    );
  }
}
