import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/add_new_credential/controller/add_new_credential_controller.dart';
import 'package:next_pass/features/add_new_credential/presentation/widgets/add_new_credential_form.dart';

class MobileAddNewCredential extends StatelessWidget {
  const MobileAddNewCredential({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddNewCredentialController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("New credential"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView (
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const AddNewCredentialForm()
          ],
        ),
      ),
    );
  }
}
