import 'package:next_pass/core/constants/app_linker.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isEditable;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.isEditable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: controller,
            enabled: isEditable,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primaryContainer,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
