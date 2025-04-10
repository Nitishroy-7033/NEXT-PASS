import '../../../../core/constants/app_linker.dart';

class ProfileContainer extends StatelessWidget {
  final String profileImageURL;
  final String name;
  final String email;
  final VoidCallback onTap;
  const ProfileContainer(
      {super.key,
      required this.profileImageURL,
      required this.name,
      required this.email,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            SizedBox(
              height: 50.w,
              width: 50.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
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
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.h,
              color: Theme.of(context).colorScheme.tertiary,
            )
          ],
        ),
      ),
    );
  }
}
