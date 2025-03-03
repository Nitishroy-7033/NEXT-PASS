import '../../../../core/constants/app_linker.dart';

class PlanCardDatabase extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  const PlanCardDatabase({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 180,
            width: 140,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )
                  : const Border(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Opacity(
              opacity: isSelected ? 1 : 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Image.asset(AppImageAssets.mongoDBLogo),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: isSelected
                ? const Border()
                : Border.all(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
          ),
        )
      ],
    );
  }
}
