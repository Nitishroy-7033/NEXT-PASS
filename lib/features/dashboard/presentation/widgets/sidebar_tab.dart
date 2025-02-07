import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        minLeadingWidth: 0,
        leading: (MediaQuery.of(context).size.width > 1000)
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                      (isSelected)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary,
                      BlendMode.srcIn),
                ),
              )
            : const SizedBox.shrink(),
        title: (MediaQuery.of(context).size.width > 1000)
            ? AutoSizeText(
                title,
                style: (isSelected)
                    ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        )
                    : Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                maxLines: 1,
              )
            : SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                    (isSelected)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary,
                    BlendMode.srcIn),
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
