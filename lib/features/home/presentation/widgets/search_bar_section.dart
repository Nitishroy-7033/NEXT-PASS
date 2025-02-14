import '../../../../core/constants/app_linker.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});
  

  @override
  Widget build(BuildContext context) {
    TextEditingController homeSearchController = TextEditingController();
    return TextField(
      autofocus: false,
      controller: homeSearchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
        constraints: const BoxConstraints(
          maxHeight: 40,
        ),
        hintText: AppStrings.searchText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
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
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      maxLines: 1,
      cursorColor: Theme.of(context).colorScheme.onSurface,
      cursorWidth: 1.5,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
