import 'package:next_pass/features/search_credential/presentations/widgets/option_container.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Search Credential",
        style: Theme.of(context).textTheme.bodyMedium,),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Column(
            children: [
                   TextField(
                    autofocus: false,
                    controller: searchController,
                    decoration: InputDecoration(
                     contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
                      constraints: const BoxConstraints(
                        maxHeight: 40,),
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
                   ),
                   const SizedBox(height: 12,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OptionContainer(label: "App"),
                      OptionContainer(label: "Website"),
                      OptionContainer(label: "Payments"),
                      OptionContainer(label: "Others")
                    ],
                   ),
                   const SizedBox(height: 29,),
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