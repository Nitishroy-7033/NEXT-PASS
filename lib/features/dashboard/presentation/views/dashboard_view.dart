import 'package:flutter/widgets.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/dashboard/presentation/screens/mobile_dashboard.dart';
import 'package:next_pass/features/dashboard/presentation/screens/web_dashboard.dart';

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
