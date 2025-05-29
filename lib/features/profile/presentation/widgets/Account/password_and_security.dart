import '../../../../../core/constants/app_linker.dart';

class PasswordAndSecurity extends StatelessWidget {
  const PasswordAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Password & Security"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            children: [
              ListTile(
                title: Text('Change Password',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                onTap: () {
                  Get.toNamed(AppRoutes.changePassword);
                },
              ),
              SizedBox(height: 10.h),
              ListTile(
                title: Text('Change Database',
                    style: Theme.of(context).textTheme.bodyMedium),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                onTap: () {
                  Get.toNamed(AppRoutes.databaseSetup);
                },
              ),
            ],
          ),
        ));
  }
}
