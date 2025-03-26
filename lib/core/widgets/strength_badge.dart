import '../constants/app_linker.dart';

class StrengthBadge extends StatelessWidget {
  final String strength;
  const StrengthBadge({super.key, required this.strength});

  Color checkColor(String strength) {
    if (strength == "Very Strong") {
      return AppColors.greenColor;
    } else if (strength == "Strong") {
      return AppColors.greenColor;
    } else if (strength == "Normal") {
      return AppColors.yellowColor;
    } else if (strength == "Weak") {
      return AppColors.error;
    } else {
      return AppColors.yellowColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: checkColor(strength),
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        spacing: 1,
        children: [
          SizedBox(
            height: 13,
            width: 13,
            child: SvgPicture.asset(
              (strength == "Strong" || strength == "Very Strong")
                  ? IconsAssets.strongPasswordIcon
                  : IconsAssets.weakPasswordIcon,
              colorFilter: ColorFilter.mode(
                checkColor(strength),
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            strength,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: checkColor(strength),
                ),
          ),
        ],
      ),
    );
  }
}
