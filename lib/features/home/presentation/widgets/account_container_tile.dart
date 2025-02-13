import 'package:next_pass/core/constants/app_linker.dart';
import 'package:flutter/material.dart';
import 'package:next_pass/core/widgets/alert_symbol.dart';
import 'package:next_pass/core/widgets/strength_badge.dart';


class AccountContainerTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String password;
  final String strength;
  final bool isAlert;
  final VoidCallback ontap;
  const AccountContainerTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle,
      required this.ontap,
      required this.password,
      required this.strength, required this.isAlert});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15),
            child: Image.asset(imageUrl),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                password,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          StrengthBadge(strength: strength),
          const SizedBox(
            width: 5,
          ),
          (isAlert)?const AlertSymbol():const SizedBox.shrink(),
        ],
      ),
    );
  }
}
