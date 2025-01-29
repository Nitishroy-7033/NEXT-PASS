import 'package:flutter/cupertino.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_dashboard.dart';
import 'package:next_pass/features/auth/presentation/screens/web/web_dashboard.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileDashboard(),
        tablet: MobileDashboard(),
        desktop: WebDashboard());
  }
}
