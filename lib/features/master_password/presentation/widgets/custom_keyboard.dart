import 'package:next_pass/core/constants/biomatric_service.dart';

import '../../../../core/constants/app_linker.dart';
class CustomKeyboard extends StatelessWidget {
  final MasterPasswordController pinController;

  const CustomKeyboard({required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemCount: 12, 
        itemBuilder: (context, index) {
          Widget buttonContent;

          if (index == 9) {
            // ✅ Biometric Icon
            buttonContent = InkWell(
              onTap: () async{
           bool check=   await  BiomatricService().authenticateLocally();
           if(check){
              Get.offAllNamed(AppRoutes.home);
           }
               
              },
              child: SvgPicture.asset(
                color: Theme.of(context).colorScheme.onSurface,
                IconsAssets.biometric_icon,
                width: 20,
                height: 20,
              ),
            );
          } else if (index == 10) {
            // ✅ Zero button
            buttonContent = const Text(
              "0",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          } else if (index == 11) {
            // ✅ Cross (❌) Backspace Icon
            buttonContent = SvgPicture.asset(
              color: Theme.of(context).colorScheme.onSurface,
              IconsAssets.crossIcon,
              width: 20,
              height: 20,
            );
          } else {
            // ✅ Number Buttons (1-9)
            buttonContent = Text(
              (index + 1).toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          }

          return GestureDetector(
            onTap: () {
              if (index == 11) {
                pinController.removeDigit(); // Cross button action
              } else if (index != 9) {
                pinController
                    .addDigit(index == 10 ? "0" : (index + 1).toString());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border(
                  top: index < 3
                      ? BorderSide.none
                      : BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 0),
                  left: index % 3 == 0
                      ? BorderSide.none
                      : BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 0),
                ),
              ),
              child: Center(child: buttonContent),
            ),
          );
        },
      ),
    );
  }
}

