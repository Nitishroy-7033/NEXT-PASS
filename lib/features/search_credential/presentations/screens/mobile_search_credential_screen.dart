import '../../../../../core/constants/app_linker.dart';

class MobileSearchCredentialScreen extends StatelessWidget {
  const MobileSearchCredentialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final List<Map<String, dynamic>> accounts = [
      {
        "title": "Facebook",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.facebookLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "Google Account",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.googleLogo,
        "password": "*********************",
        "strength": "Weak",
        "isAlert": false
      },
      {
        "title": "PlayStore",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.playstoreLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "Twitter",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.twitterLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "LinkedIn",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.linkedinLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "Facebook",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.facebookLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "Google Account",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.googleLogo,
        "password": "*********************",
        "strength": "Weak",
        "isAlert": false
      },
      {
        "title": "PlayStore",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.playstoreLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "Twitter",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.twitterLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
      {
        "title": "LinkedIn",
        "emailId": "Nitishr833@gmail.com",
        "imageUrl": AppImageAssets.linkedinLogo,
        "password": "*********************",
        "strength": "Strong",
        "isAlert": true
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Credential",
        ),
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 12.h),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: searchController,
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
            ),
            SizedBox(
              height: 12.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionContainer(label: "App"),
                OptionContainer(label: "Website"),
                OptionContainer(label: "Payments"),
                OptionContainer(label: "Others"),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return AccountContainerTile(
                    title: account["title"],
                    emailId: account["emailId"],
                    imageUrl: account["imageUrl"],
                    password: account["password"],
                    strength: account["strength"],
                    isAlert: account["isAlert"],
                    ontap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
