import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop;
    } else if (Responsive.isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
