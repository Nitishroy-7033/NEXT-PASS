import '../../../../core/constants/app_linker.dart';

class AllCredentialsSection extends StatelessWidget {
  const AllCredentialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountContainerTile(
          title: "Facebook",
          emailId: "rosepoole@email.com",
          imageUrl: AppImageAssets.facebookLogo,
          password: "*********************",
          strength: "Strong",
          isAlert: true,
          ontap: () {},
        ),
        AccountContainerTile(
          title: "Google",
          emailId: "rosepoole@email.com",
          password: "*********************",
          strength: "Weak",
          imageUrl: AppImageAssets.googleLogo,
          isAlert: false,
          ontap: () {},
        ),
        AccountContainerTile(
          title: "Playstore",
          emailId: "rosepoole@email.com",
          password: "*********************",
          strength: "Strong",
          imageUrl: AppImageAssets.playstoreLogo,
          isAlert: true,
          ontap: () {},
        ),
        AccountContainerTile(
          title: "Twitter",
          emailId: "rosepoole@email.com",
          password: "*********************",
          strength: "Weak",
          imageUrl: AppImageAssets.twitterLogo,
          isAlert: false,
          ontap: () {},
        ),
        AccountContainerTile(
          title: "Linkedin",
          emailId: "rosepoole@email.com",
          password: "*********************",
          strength: "Strong",
          imageUrl: AppImageAssets.linkedinLogo,
          isAlert: false,
          ontap: () {},
        ),
        AccountContainerTile(
          title: "Twitter",
          emailId: "rosepoole@email.com",
          password: "*********************",
          strength: "Weak",
          imageUrl: AppImageAssets.twitterLogo,
          isAlert: false,
          ontap: () {},
        ),
        AccountContainerTile(
          title: "Linkedin",
          emailId: "rosepoole@email.com",
          password: "*********************",
          strength: "Strong",
          imageUrl: AppImageAssets.linkedinLogo,
          isAlert: true,
          ontap: () {},
        ),
      ],
    );
  }
}
