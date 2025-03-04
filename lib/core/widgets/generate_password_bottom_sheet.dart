import 'package:next_pass/core/constants/app_linker.dart';


// ignore: non_constant_identifier_names
Future<dynamic> BottomSheetPasswordGenerator(BuildContext context) {
  PasswordController passwordController = Get.put(PasswordController());
  return Get.bottomSheet(
    Container(
      height: 425,
      width: 396,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).colorScheme.primaryContainer,
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
            const Center(child: Text(AppStrings.generatePassword)),
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
                hintText: AppStrings.passwordHintText,
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
                    SizedBox(width: 10),
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
                    SizedBox(width: 10),
                    Text(
                      AppStrings.useNumbers,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              ],
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
                            value: passwordController.useLowerCase.value,
                            onChanged: (value) {
                              passwordController.useLowerCase.value = value!;
                            }),
                      ),
                    ),
                    SizedBox(width: 10),
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
                    SizedBox(width: 10),
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
            PrimaryButton(text: AppStrings.createAccount, onPressed: () {}),
            // header widget
           GeneratePasswordHeaderWidget(),
            // footer widget
            GeneratePasswordFooterWidget(),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
