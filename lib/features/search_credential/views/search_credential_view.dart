
import '../../../../core/constants/app_linker.dart';

class SearchCredentialView extends StatelessWidget {
  const SearchCredentialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: MobileSearchCredentialScreen(),
        tablet: MobileSearchCredentialScreen(),
        desktop: WebSearchCredentialScreen());
  }
}
