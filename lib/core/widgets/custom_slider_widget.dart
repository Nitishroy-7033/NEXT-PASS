import 'package:next_pass/core/constants/app_linker.dart';

// ignore: must_be_immutable
class CustomSliderWidget extends StatelessWidget {
  double value;
  void Function(double)? onChanged;
  Color? activeColor;
  double minimumValue;
  double maximumValue;
  Color? inActiveColor;
  String? label;
  CustomSliderWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.maximumValue = 0,
    this.minimumValue = 0,
    this.label,
    this.inActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      min: minimumValue,
      max: maximumValue,
      label: label,
      inactiveColor: inActiveColor,
    );
  }
}
