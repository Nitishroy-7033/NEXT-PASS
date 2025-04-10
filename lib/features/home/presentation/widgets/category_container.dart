import '../../../../core/constants/app_linker.dart';

class CategoryContainer extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  const CategoryContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 82.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(15.r),
            child: Container(
              height: 50.w,
              width: 50.w,
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
