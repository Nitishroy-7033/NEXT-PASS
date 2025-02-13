

import '../../../../core/constants/app_linker.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileNotFoundScreen(),
        tablet: MobileNotFoundScreen(),
        desktop: WebNotFoundScreen());
  }
}
