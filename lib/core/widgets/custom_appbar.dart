import 'package:next_pass/core/constants/app_linker.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Title text
  final Widget? actionIcon; // Optional Right-side icon

  const CustomAppBar({
    super.key,
    required this.title,
    this.actionIcon, // Default null, means optional
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Theme.of(context).colorScheme.primaryContainer, // Dark Theme Color
      elevation: 2, // No Shadow
      leading: IconButton(
        // Back Button (Mandatory)
        icon: SvgPicture.asset(
          IconsAssets.back_icon,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn),
        ),

        // Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true, // Center the title
      actions: actionIcon != null ? [actionIcon!] : [], // Show only if provided
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
