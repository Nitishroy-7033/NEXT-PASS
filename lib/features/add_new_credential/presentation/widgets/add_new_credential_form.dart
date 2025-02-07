import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

import '../../controller/add_new_credential_controller.dart';

class AddNewCredentialForm extends StatelessWidget {
  const AddNewCredentialForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AddNewCredentialController controller = Get.find<AddNewCredentialController>();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Row(
            children: [
              Text("Credential"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Site Address",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller:controller. siteUrl,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.language),
              hintText: "www.example.com",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "User Name",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: controller.userName,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "User Name",
            ),
          ),
         
          Row(
            children: [
              Text(
                "Password",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: controller.password,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password),
              hintText: "**********",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Email",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: controller.emailId,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "user@gmail.com",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.done,
            controller: controller.mobileNumber,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.numbers),
              hintText: "+91000000000",
            ),
          ),
          const SizedBox(height:  30),
          PrimaryButton(text: "SAVE", onPressed: (){
            controller.saveCredential();
          },icon: IconsAssets.lockIcon,),
          const SizedBox(height:  10),
        ],
      ),
    );
  }
}
