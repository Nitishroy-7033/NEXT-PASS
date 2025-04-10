import 'package:flutter/services.dart';

import '../constants/app_linker.dart';

void updateSystemUIBasedOnTheme(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  WidgetsBinding.instance.addPostFrameCallback(
    (_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: colorScheme.brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light, // Status bar icons color
          systemNavigationBarColor:
              Theme.of(context).colorScheme.surface, // Navigation bar color
          systemNavigationBarIconBrightness:
              colorScheme.brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light, // Navigation bar icons color
        ),
      );
    },
  );
}