import '../../../../core/constants/app_linker.dart';

class SearchBarSection extends StatelessWidget {
  final VoidCallback onTap;
  const SearchBarSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController homeSearchController = TextEditingController();
    return TextField(
      autofocus: false,
      onTap: onTap,
      controller: homeSearchController,
      canRequestFocus: false,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 5.h, right: 5.w),
        constraints: BoxConstraints(
          maxHeight: 43.h,
        ),
        hintText: AppStrings.searchText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            IconsAssets.searchIcon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiary,
              BlendMode.srcIn,
            ),
          ),
        ),
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      maxLines: 1,
      cursorColor: Theme.of(context).colorScheme.onSurface,
      cursorWidth: 1.5.w,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
