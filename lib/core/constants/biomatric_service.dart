import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class BiomatricService {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> authenticateLocally() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: "Authenticate to access the app",
          options: AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ));
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
      } else {
        // ...
      }
    } catch (e) {
      isAuthenticated = false;
      print("error in biometric authentication: $e");
    }

    return isAuthenticated;
  }
}