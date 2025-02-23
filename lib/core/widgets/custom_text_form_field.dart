import '../constants/app_linker.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String? hintText;
  String? labelText;
  TextStyle? textFormFieldStyle;
  TextStyle? hintTextStyle;
  TextStyle? labelTextStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;

   CustomTextFormField({
    super.key,
    this.textFormFieldStyle,
    this.hintText,
    this.hintTextStyle,
    this.labelText,
    this.labelTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: textFormFieldStyle,
      decoration: InputDecoration(
        hintStyle: hintTextStyle,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelTextStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
