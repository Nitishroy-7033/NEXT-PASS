// ignore: file_names
import 'package:next_pass/core/constants/app_linker.dart';

class ChangeIconWidget extends StatelessWidget {
  const ChangeIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: w / 4,
          height: w / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "App Name",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
