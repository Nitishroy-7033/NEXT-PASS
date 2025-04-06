import '../../../../core/constants/app_linker.dart';

class ViewProfileSection extends StatelessWidget {
  final String profileImageURL;
  final String userName;
  final VoidCallback onTap;
  const ViewProfileSection(
      {super.key,
      required this.profileImageURL,
      required this.userName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.all(4.w),
        child: Row(
          children: [
            SizedBox(
              height: 35.w,
              width: 35.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: (profileImageURL.isNotEmpty)
                    ? Image.network(
                        profileImageURL,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person);
                        },
                      )
                    : const Icon(Icons.person),
              ),
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 100.w),
                  child: Text(
                    userName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.viewLink,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(width: 3.w),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10.h,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
