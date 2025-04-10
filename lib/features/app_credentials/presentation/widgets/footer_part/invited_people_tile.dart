import '../../../../../core/constants/app_linker.dart';

class InvitedPeopleTile extends StatelessWidget {
  final String invitedPeopleImageURL;
  final String invitedPeopleEmail;
  final VoidCallback onCancelTap;
  const InvitedPeopleTile({
    super.key,
    required this.invitedPeopleImageURL,
    required this.invitedPeopleEmail,
    required this.onCancelTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          SizedBox(
            height: 24.w,
            width: 24.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: Image.network(
                invitedPeopleImageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              invitedPeopleEmail,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            onTap: onCancelTap,
            child: Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.w,
                ),
                color:
                    Theme.of(context).colorScheme.error.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(5.r),
              ),
              padding: EdgeInsets.all(4.w),
              child: SvgPicture.asset(
                IconsAssets.cross_cancel_icon,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.error,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
