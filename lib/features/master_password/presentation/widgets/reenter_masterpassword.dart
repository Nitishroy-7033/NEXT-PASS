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
        // Obx(() {
        //   return Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: List.generate(pinController.pinLength, (index) {
        //       bool isFilled = index < pinController.enteredDigits.value.length;
        //       return Container(
        //         width: w / 8,
        //         height: w / 8,
        //         margin: const EdgeInsets.symmetric(horizontal: 10),
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(14),
        //           border: Border.all(
        //             color: Theme.of(context).colorScheme.tertiary,
        //             width: 1,
        //           ),
        //         ),
        //         child: isFilled
        //             ? Icon(Icons.circle, size: 10, color: Colors.black)
        //             : Container(),
        //       );
        //     }),
        //   );
        // }),
      ],
    );
  }
}
