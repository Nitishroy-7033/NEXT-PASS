import '../../../../core/constants/app_linker.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileDashboard(),
      tablet: WebDashboard(),
      desktop: WebDashboard(),
    );
  }
}
