

import '../../../../core/constants/app_linker.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController navBarController = Get.put(NavController());
    return Scaffold(
      extendBody: true,
      floatingActionButton: CustomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      body: Obx(
        () => navBarController.pages[navBarController.selectedIndex.value],
      ),
    );
  }
}
