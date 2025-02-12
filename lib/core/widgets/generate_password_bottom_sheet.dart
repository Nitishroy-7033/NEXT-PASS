import 'package:next_pass/core/constants/app_linker.dart';

class GeneratePasswordBottomSheet extends StatelessWidget {
  final PasswordController passwordController = Get.put(PasswordController());
  GeneratePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      width: 396,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(child: Text('Generate Password')),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "Montserrat",
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: "Montserrat",
                ),
                hintText: 'HJ_sd763!@%sndf.//!!@22222222',
                suffixIcon: Icon(
                  Icons.autorenew_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => CustomCheckbox(
                      value: passwordController.useUpperCase.value,
                      onChanged: (value) {
                        passwordController.useUpperCase.value = value!;
                      }),
                ),
                Text(
                  'Use Uppercase',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Obx(
                  () => CustomCheckbox(
                      value: passwordController.useNumbers.value,
                      onChanged: (value) {
                        passwordController.useNumbers.value = value!;
                      }),
                ),
                Text(
                  'Use Numbers',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => CustomCheckbox(
                      value: passwordController.useLowerCase.value,
                      onChanged: (value) {
                        passwordController.useLowerCase.value = value!;
                      }),
                ),
                Text(
                  'Use Lowercase',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Obx(
                  () => CustomCheckbox(
                      value: passwordController.useSymbol.value,
                      onChanged: (value) {
                        passwordController.useSymbol.value = value!;
                      }),
                ),
                Text(
                  'Use Symbols',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Password Length',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(
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
            PrimaryButton(text: 'CREATE ACCOUNT', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
