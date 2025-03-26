import 'package:next_pass/core/constants/app_linker.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> itemList;
  final dynamic controller;
  final double popupWidth;
  final double maxWidth;
  final double maxHeight;

  const CustomDropdown({
    super.key,
    required this.itemList,
    required this.popupWidth,
    required this.maxWidth,
    required this.maxHeight,
    required this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    final customDropdownController = Get.put(controller, tag: controller.hashCode.toString());
    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Obx(
        () => DropdownButton<String>(
          borderRadius: BorderRadius.circular(5),
          onChanged: (value) {
            customDropdownController.setDropdownValue(value.toString());
          },
          hint: Text(
            customDropdownController.selectedValue.value,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          underline: const SizedBox.shrink(),
          dropdownColor: Theme.of(context).colorScheme.surface,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
          isExpanded: true,
          iconEnabledColor: Theme.of(context).colorScheme.tertiary,
          menuWidth: popupWidth,
          padding: const EdgeInsets.only(left: 7, top: 5, bottom: 5),
          items: itemList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
