import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/master_password/presentation/getx/controller/master_password_controller.dart';

class ReenterMasterPinWidget extends StatelessWidget {
  final MasterPasswordController pinController = Get.find();
  ReenterMasterPinWidget({Key? key}) : super(key: key); // ✅ Add key

  @override
  Widget build(BuildContext context) {
    
    final double w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Re-enter Master PIN",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ],
    );
  }
}
