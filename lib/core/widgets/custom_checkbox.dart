import '../constants/app_linker.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatelessWidget {
  bool value;
  void Function(bool?)? onChanged;
  Color? activeColor;
  CustomCheckbox(
      {super.key,
      required this.value,
      required this.onChanged,
      this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }
}
