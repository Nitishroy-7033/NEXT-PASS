import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';

class SidebarTab extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;
  const SidebarTab(
      {super.key,
      required this.title,
      required this.icon,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
                (isSelected)
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn),
          ),
        ),
        title: Text(
          title,
          style: (isSelected)
              ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  )
              : Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
        ),
        selected: isSelected,
        selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
        splashColor: Colors.transparent,
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.all(0),
        onTap: onTap,
      ),
    );
  }
}
