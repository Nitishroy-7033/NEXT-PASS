import '../constants/app_linker.dart';

class ShareCredentialFooterWidget extends StatelessWidget {
  const ShareCredentialFooterWidget({super.key});

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
              prefixIcon: const Icon(
                Icons.alternate_email_rounded,
                color: AppColors.labelLight,
              ),
              suffixIcon: const Icon(
                Icons.done,
                color: AppColors.labelLight,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: AppStrings.shareEmail,
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: AppStrings.readMore,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryLight),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('clicked');
                        }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(text: AppStrings.btnSave, onPressed: () {})
      ],
    );
  }
}