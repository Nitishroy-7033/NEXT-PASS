import '../constants/app_linker.dart';

class GeneratePasswordHeaderWidget extends StatelessWidget {
   GeneratePasswordHeaderWidget({super.key});

  final PasswordController passwordController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          textFormFieldStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: "Montserrat",
          ),
          hintText: AppStrings.passwordHintText,
          hintTextStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontFamily: "Montserrat",
          ),
          suffixIcon: Icon(
            Icons.autorenew_sharp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(
                  () => SizedBox(
                    width: 20,
                    child: CustomCheckbox(
                        value: passwordController.useUpperCase.value,
                        onChanged: (value) {
                          passwordController.useUpperCase.value = value!;
                        }),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  AppStrings.useUpperCase,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                Obx(
                  () => SizedBox(
                    width: 20,
                    child: CustomCheckbox(
                        value: passwordController.useNumbers.value,
                        onChanged: (value) {
                          passwordController.useNumbers.value = value!;
                        }),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  AppStrings.useNumbers,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
