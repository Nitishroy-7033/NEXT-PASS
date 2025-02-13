import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/constants/app_colors.dart';

class StrengthBadge extends StatelessWidget {
  final String strength;
  const StrengthBadge({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: (strength == "Strong")
                ? AppColors.greenColor
                : AppColors.yellowColor,
            width: 0.5,
          )),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          SizedBox(
            height: 13,
            width: 13,
            child: SvgPicture.asset(
              (strength == "Strong")
                  ? IconsAssets.strongPasswordIcon
                  : IconsAssets.weakPasswordIcon,
              colorFilter: ColorFilter.mode(
                (strength == "Strong")
                    ? AppColors.greenColor
                    : AppColors.yellowColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            strength,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: (strength == "Strong")
                      ? AppColors.greenColor
                      : AppColors.yellowColor,
                ),
          ),
        ],
      ),
    );
  }
}
