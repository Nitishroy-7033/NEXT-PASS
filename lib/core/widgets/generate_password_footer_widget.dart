import '../constants/app_linker.dart';

class GeneratePasswordFooterWidget extends StatelessWidget {
  GeneratePasswordFooterWidget({super.key});

  final PasswordController passwordController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(
                  () => SizedBox(
                    width: 20,
                    child: CustomCheckbox(
                        value: passwordController.useLowerCase.value,
                        onChanged: (value) {
                          passwordController.useLowerCase.value = value!;
                        }),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  AppStrings.useLowerCase,
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
                        value: passwordController.useSymbol.value,
                        onChanged: (value) {
                          passwordController.useSymbol.value = value!;
                        }),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  AppStrings.useSymbols,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppStrings.passwordLength,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Expanded(
                flex: 2,
                child: CustomSliderWidget(
                  maximumValue: 20,
                  minimumValue: 0,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inActiveColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  value: passwordController.sliderValue.value,
                  onChanged: (value) {
                    passwordController.sliderValue.value = value;
                  },
                ),
              ),
            ),
            Obx(() => Text(
                  passwordController.sliderValue.value.toStringAsFixed(0),
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        PrimaryButton(text: AppStrings.btnCopyPassword, onPressed: () {})
      ],
    );
  }
}
