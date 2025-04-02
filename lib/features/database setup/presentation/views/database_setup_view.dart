
import '../../../../core/constants/app_linker.dart';

class DatabaseSetupView extends StatelessWidget {
  const DatabaseSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Responsive(
      mobile: MobileDatabaseSetup(),
      tablet: WebDatabaseSetup(),
      desktop: WebDatabaseSetup(),
    );
  }
}
