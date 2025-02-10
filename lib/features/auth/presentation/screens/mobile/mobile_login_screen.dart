import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_colors.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        
        children: [
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
                "Password",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
                child: Checkbox(value:true, onChanged:(value){
                }),
              ),
              SizedBox(width: 10,),
              Text("Remember me")
            ],
          ),
          PrimaryButton(text: 'LOGIN', onPressed: (){}),
          const SizedBox(height: 20),
          const Text('Forget Password?',style: TextStyle(color: AppColors.primaryDark),),
        ],
      ),
      
    );
  }
}






