import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';

class AlertSymbol extends StatelessWidget {
  const AlertSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Theme.of(context).colorScheme.error,
                  width: 0.5,
                )),
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              height: 12,
              width: 12,
              child: SvgPicture.asset(
                IconsAssets.alertIcon,
              ),
            ),
          );
  }
}