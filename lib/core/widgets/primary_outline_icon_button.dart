import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryOutlineIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? icon;

  final Color? color;
  final Color? outlineColor;
  const PrimaryOutlineIconButton(
      {super.key,
      required this.onPressed,
      this.icon,
      this.outlineColor,
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
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: outlineColor ?? Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        child: SvgPicture.asset(
          icon!,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
