

import '../../../../../core/constants/app_linker.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password),
              hintText: "**********",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(
              width: 20,
              child: Checkbox(value: true, onChanged: (value){})),

              SizedBox(width: 10,),
             Text(
              "Remember Me",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],),
           
          PrimaryButton(text: "LOGIN", onPressed: (){
            Get.toNamed(AppRoutes.masterPassword);
          })
        ],
      ),
    );
  }
}
