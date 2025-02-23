import 'package:next_pass/core/constants/app_linker.dart';


class MobileDatabaseSetup extends StatelessWidget {
  const MobileDatabaseSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              children: [
                Text(
                  AppStrings.headingDS,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    AppStrings.definationDS,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // Select Databse Section
                const SelectDatabaseSection(),
                // const Spacer(),
                const SizedBox(height: 30),
                // Databse URL Section for Own Database
                const DatabaseUrlSection(),
                // const Spacer(),
                const SizedBox(height: 30),
                // Save Button
                PrimaryButton(
                  text: AppStrings.startButton,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                Text.rich(
                  TextSpan(
                      text: AppStrings.ourDataProtectionDS,
                      style: Theme.of(context).textTheme.labelMedium,
                      children: [
                        TextSpan(
                          text: AppStrings.readMoreDS,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
