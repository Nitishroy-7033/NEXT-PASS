import '../constants/app_linker.dart';

class GeneratePasswordButton extends StatelessWidget {
  const GeneratePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomSheetPasswordGenerator(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.autorenew_rounded,
              color: Theme.of(context).colorScheme.onSurface,
              size: 16,
            ),
            const SizedBox(width: 3),
            Text(
              AppStrings.generatePassword,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
