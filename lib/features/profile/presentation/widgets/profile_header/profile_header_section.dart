import 'package:next_pass/core/constants/app_linker.dart';

class ProfileHeaderSection extends StatelessWidget {
  final ProfileController profileController;
  const ProfileHeaderSection({required this.profileController, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final profile = profileController.profileModel.value;
      return ProfileContainer(
        profileImageURL: "",
        name: "${profile?.firstName ?? "First"} ${profile?.lastName ?? "Last"}",
        email: profile?.email ?? "No email available",
        onTap: () {},
      );
    });
  }
}
