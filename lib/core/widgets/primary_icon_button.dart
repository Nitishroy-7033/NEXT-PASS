import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? icon;

  final Color? color;
  final Color? backgroundColor;
  const PrimaryIconButton(
      {super.key,
      required this.onPressed,
      this.icon,
      this.backgroundColor,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(0),
        ),
        child: SvgPicture.asset(
          icon!,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
