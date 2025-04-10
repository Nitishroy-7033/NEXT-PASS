import '../../../../../core/constants/app_linker.dart';

class CredentialDataWidget extends StatelessWidget {
  final bool isEditing;
  final dynamic title;
  final dynamic siteURL;
  final dynamic userName;
  final dynamic email;
  final dynamic password;
  final dynamic controller;
  const CredentialDataWidget({
    super.key,
    required this.isEditing,
    required this.title,
    required this.siteURL,
    required this.userName,
    required this.email,
    required this.password,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          CustomTextField(
            label: "Title",
            controller: title,
            icon: Icons.language,
            isEditable: isEditing,
          ),
          CustomTextField(
            label: "Site URL",
            controller: siteURL,
            isEditable: isEditing,
            icon: Icons.public,
          ),
          CustomTextField(
            label: "Username",
            controller: userName,
            isEditable: isEditing,
            icon: Icons.person,
          ),
          CustomTextField(
            label: "Email",
            controller: email,
            isEditable: isEditing,
            icon: Icons.email,
          ),
          PasswordField(
            passwordControllerText: password,
            credentialController: controller,
          ),
        ],
      ),
    );
  }
}
