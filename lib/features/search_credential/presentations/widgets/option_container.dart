import 'package:next_pass/core/constants/app_linker.dart';

class OptionContainer extends StatelessWidget {
  final String label;
  const OptionContainer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26.h,
      width: 75.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
          child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall,
        textAlign: TextAlign.center,
      )),
    );
  }
}
