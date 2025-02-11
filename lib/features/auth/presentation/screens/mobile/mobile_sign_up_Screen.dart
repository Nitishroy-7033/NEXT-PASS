
import '../../../../../core/constants/app_linker.dart';

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "User Name",
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
          PrimaryButton(text: "SIGNUP", onPressed: (){})
        ],
      ),
    );
  }
}
