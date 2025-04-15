import 'package:next_pass/core/constants/app_linker.dart';

class PreferenceOptionsSection extends StatelessWidget {
  const PreferenceOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("PREFERENCE", style: Theme.of(context).textTheme.labelMedium),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: Text('Notification', style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: Text('Appearance', style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.dark_mode),
          title: Text('Dark Mode', style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          onTap: () {},
        ),
      ],
    );
  }
}
