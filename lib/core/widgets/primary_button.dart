import 'package:next_pass/core/constants/app_linker.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? icon;
  final Color? color;
  final Color? backgroundColor;
  const PrimaryButton(
      {super.key,
      required this.text,
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
        height: 50.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                colorFilter: ColorFilter.mode(
                  color ?? Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            if (icon != null) SizedBox(width: 10.w),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color ?? Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      ),
    );
  }
}
