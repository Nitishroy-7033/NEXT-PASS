import '../constants/app_linker.dart';

class AlertSymbol extends StatelessWidget {
  const AlertSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.error,
            width: 0.7.w,
          )),
      padding: EdgeInsets.all(4.w),
      child: SizedBox(
        height: 12.w,
        width: 12.w,
        child: SvgPicture.asset(
          IconsAssets.alertIcon,
        ),
      ),
    );
  }
}
