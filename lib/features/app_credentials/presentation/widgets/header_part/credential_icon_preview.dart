import '../../../../../core/constants/app_linker.dart';

class CredentialIconPreview extends StatelessWidget {
  final String credentialIconURL;
  const CredentialIconPreview({super.key, required this.credentialIconURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82.w,
      height: 82.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(10.w),
      child: (credentialIconURL.isNotEmpty)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                "https://www.google.com/s2/favicons?sz=128&domain=$credentialIconURL",
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppImageAssets.appLogo);
                },
              ),
            )
          : Image.asset(AppImageAssets.appLogo),
    );
  }
}
