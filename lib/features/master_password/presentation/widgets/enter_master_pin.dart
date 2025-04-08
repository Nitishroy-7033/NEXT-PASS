import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/master_password/presentation/getx/controller/master_password_controller.dart';

class EnterMasterPinWidget extends StatelessWidget {
  EnterMasterPinWidget({Key? key}) : super(key: key); // ✅ Add key

  final MasterPasswordController pinController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Enter Your M-PIN",
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
    );
  }
}
