

import 'package:next_pass/features/database%20setup/presentation/screens/mobile_database_setup.dart';
import 'package:next_pass/features/database%20setup/presentation/screens/web_database_setup.dart';

import '../../../../core/constants/app_linker.dart';

class DatabaseSetupView extends StatelessWidget {
  const DatabaseSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileDatabaseSetup(),
      tablet: WebDatabaseSetup(),
      desktop: WebDatabaseSetup(),
    );
  }
}
