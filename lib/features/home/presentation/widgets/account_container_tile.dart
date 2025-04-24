import '../../../../core/constants/app_linker.dart';

class AccountContainerTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String emailId;
  final String password;
  final String strength;
  final bool isAlert;
  final VoidCallback ontap;
  const AccountContainerTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.emailId,
      required this.ontap,
      required this.password,
      required this.strength,
      required this.isAlert});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 60.w,
            width: 60.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: (imageUrl.isNotEmpty)
                ? Image.network(
                    "https://www.google.com/s2/favicons?sz=128&domain=$imageUrl",
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(AppImageAssets.appLogo);
                    },
                  )
                : Image.asset(AppImageAssets.appLogo),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 5.h),
                Text(
                  emailId,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 5.h),
                Text(
                  password,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          StrengthBadge(strength: strength),
          SizedBox(width: 5.w),
          (isAlert) ? const AlertSymbol() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
