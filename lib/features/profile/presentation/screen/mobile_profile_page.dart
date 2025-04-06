import 'package:flutter/material.dart';
import '../../../../core/constants/app_linker.dart';

class MobileProfilePage extends StatelessWidget {
  const MobileProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://writestylesonline.com/wp-content/uploads/2018/11/Three-Statistics-That-Will-Make-You-Rethink-Your-Professional-Profile-Picture.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: const Text('Nitish Kumar'),
                subtitle: Text(
                  'Nitishr833@gmail.com',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "ACCOUNT",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: const Icon(Icons.person),
                title: Text('Personal Info',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: const Icon(Icons.password),
                title: Text('Password & Security',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: const Icon(Icons.privacy_tip),
                title: Text('Privacy',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "PREFERENCE",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: const Icon(Icons.notifications),
                title: Text('Notification',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: const Icon(Icons.color_lens),
                title: Text('Appearence',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                onTap: () {
                  // Handle the tap event here
                },
                leading: const Icon(Icons.dark_mode),
                title: Text('Dark Mode',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                onTap: () {
                  authController.logOut();
                  Get.offAllNamed(AppRoutes.authtab);
                  // Handle the tap event here
                },
                leading: const Icon(Icons.logout),
                title: Text('Logout',
                    style: Theme.of(context).textTheme.bodyMedium),
              )
            ],
          ),
        ));
  }
}
