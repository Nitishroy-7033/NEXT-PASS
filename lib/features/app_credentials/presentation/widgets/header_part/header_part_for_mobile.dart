import 'package:next_pass/core/constants/app_linker.dart';

// Header Widget with Icon & Vulnerability Alert
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ChangeIconWidget(), // Custom Icon Box
        SizedBox(height: 30),
        YouAreSafeWidget(), // Custom Alert Box
      ],
    );
  }
}
