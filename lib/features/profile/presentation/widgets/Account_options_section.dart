import 'package:next_pass/core/constants/app_linker.dart';

class AccountOptionsSection extends StatelessWidget {
  const AccountOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ACCOUNT", style: Theme.of(context).textTheme.labelMedium),
        ListTile(
          leading: const Icon(Icons.person),
          title: Text('Personal Info', style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          onTap: () {
            
          },
        ),
        ListTile(
          leading: const Icon(Icons.password),
          title: Text('Password & Security', style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip),
          title: Text('Privacy', style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          onTap: () {},
        ),
      ],
    );
  }
}
