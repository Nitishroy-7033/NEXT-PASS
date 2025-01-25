import 'package:get/get.dart';
import 'package:next_pass/presentation/views/home/home_view.dart';

// Import your screens here
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