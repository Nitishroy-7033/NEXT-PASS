import '../constants/app_linker.dart';

class GeneratePasswordButton extends StatelessWidget {
  const GeneratePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bottomSheetPasswordGenerator(context);
      },
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.autorenew_rounded,
              color: Theme.of(context).colorScheme.onSurface,
              size: 16.h,
            ),
            SizedBox(width: 3.w),
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
