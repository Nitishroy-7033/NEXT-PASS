import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/master_password/presentation/getx/controller/master_password_controller.dart';

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
