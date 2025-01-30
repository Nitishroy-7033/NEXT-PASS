import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? icon;
  final Color? color;
  final Color? outlineColor;
  const SecondaryButton(
      {super.key,
      required this.text,
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
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: outlineColor ?? Theme.of(context).colorScheme.onSurface,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                color: color ?? Theme.of(context).colorScheme.onSurface,
              ),
            if (icon != null) const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color ?? Theme.of(context).colorScheme.onSurface,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
