import '../../../../core/constants/app_linker.dart';

class MobileGetStartedScreen extends StatelessWidget {
  const MobileGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStartedController getStartedController =
        Get.put(GetStartedController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getStartedController
                    .viewList[getStartedController.selectedView.value],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      width: (getStartedController.selectedView.value == 0)
                          ? 10
                          : 8,
                      height: (getStartedController.selectedView.value == 0)
                          ? 10
                          : 8,
                      duration: const Duration(milliseconds: 50),
                      decoration: BoxDecoration(
                        color: (getStartedController.selectedView.value == 0)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedContainer(
                      width: (getStartedController.selectedView.value == 1)
                          ? 10
                          : 8,
                      height: (getStartedController.selectedView.value == 1)
                          ? 10
                          : 8,
                      duration: const Duration(milliseconds: 50),
                      decoration: BoxDecoration(
                        color: (getStartedController.selectedView.value == 1)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
                PrimaryButton(
                  text: (getStartedController.selectedView.value == 0)
                      ? AppStrings.nextButton
                      : AppStrings.startButton,
                  onPressed: () {
                    (getStartedController.selectedView.value == 0)
                        ? getStartedController.selectedView.value = 1
                        : Get.toNamed(AppRoutes.authtab);
                  },
                ),
                TextButton(
                  onPressed: () {
                    (getStartedController.selectedView.value == 0)
                        ? getStartedController.selectedView.value = 1
                        : getStartedController.selectedView.value = 0;
                  },
                  child: Text(
                    (getStartedController.selectedView.value == 0)
                        ? AppStrings.skipButton
                        : AppStrings.backButton,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
