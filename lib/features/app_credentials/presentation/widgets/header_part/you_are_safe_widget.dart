// Widget for "Change Icon"
import 'package:next_pass/core/constants/app_linker.dart';

// Widget for "Vulnerability Alert"
class YouAreSafeWidget extends StatelessWidget {
  const YouAreSafeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreen, width: 2),
        color: AppColors.greenColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            IconsAssets.strongPasswordIcon,
            width: w / 10,
            height: w / 10,
            colorFilter:
                const ColorFilter.mode(AppColors.lightGreen, BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppStrings.youareSafeText,
                  style: TextStyle(
                    color: AppColors.lightGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "This password is Strong and Safe",
                  style: TextStyle(
                    color: AppColors.greenColor.withOpacity(1.0),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
    );
  }
}
