import 'package:get/get.dart';

// Import your screens here
import '../../features/home/presentation/screens/home_view.dart';
import 'app_routes.dart';

class RouteGenerator {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
      ),

    ];
  }
}