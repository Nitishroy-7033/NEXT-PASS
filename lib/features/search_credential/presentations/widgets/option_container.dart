import '../../../../core/constants/app_linker.dart';

class OptionContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const OptionContainer(
      {super.key,
      required this.label,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 26.h,
        width: 75.w,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10.r),
            border: (isSelected)
                ? Border.all(color: Theme.of(context).colorScheme.primary)
                : null),
        child: Center(
            child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: (isSelected)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.tertiary),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
