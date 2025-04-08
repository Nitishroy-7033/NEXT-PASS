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
          borderRadius: BorderRadius.circular(10.r),
          child: AnimatedContainer(
            height: 195.h,
            width: 149.w,
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10.r),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )
                  : const Border(),
            ),
            padding: EdgeInsets.symmetric(horizontal: 28.w),
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
        SizedBox(height: 15.h),
        AnimatedContainer(
          width: 17.w,
          height: 17.w,
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
            border: isSelected
                ? const Border()
                : Border.all(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
          ),
        ),
      ],
    );
  }
}
