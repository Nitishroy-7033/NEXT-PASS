import 'package:next_pass/core/constants/app_linker.dart';

class WeakPasswordAlert extends StatelessWidget {
  const WeakPasswordAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.orangeColor.withValues(alpha:  0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.orangeColor),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            IconsAssets.warning_icon,
            height: 15,
            width: 15,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              AppStrings.weakDescription,
              style: TextStyle(color: AppColors.orangeColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
