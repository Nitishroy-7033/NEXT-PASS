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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            enabled: isEditable,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            decoration: InputDecoration(
              prefixIcon: Icon(icon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
