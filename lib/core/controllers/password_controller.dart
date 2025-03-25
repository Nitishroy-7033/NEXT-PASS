import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  var useUpperCase = true.obs;
  var useLowerCase = true.obs;
  var useNumbers = true.obs;
  var useSymbols = true.obs;
  var sliderValue = 8.0.obs;
  var generatedPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Automatically regenerate password when any setting changes
    ever(useUpperCase, (_) => generatePassword());
    ever(useLowerCase, (_) => generatePassword());
    ever(useNumbers, (_) => generatePassword());
    ever(useSymbols, (_) => generatePassword());
    ever(sliderValue, (_) => generatePassword());

    generatePassword(); // Generate password initially
  }

  void generatePassword() {
    print("Welcome");
    const upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+{}[]|;:,.<>?';

    String characters = '';
    if (useUpperCase.value) characters += upperCaseLetters;
    if (useLowerCase.value) characters += lowerCaseLetters;
    if (useNumbers.value) characters += numbers;
    if (useSymbols.value) characters += symbols;

    if (characters.isEmpty) {
      generatedPassword.value = 'Select at least one option';
      return;
    }

    final random = Random();
    generatedPassword.value = List.generate(
      sliderValue.value.toInt(),
      (index) => characters[random.nextInt(characters.length)],
    ).join();
    print("GENERATE" + generatedPassword.value);
  }

  String checkPasswordStrength(String password) {
    if (password.length < 6) return 'Weak';

    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasNumber = password.contains(RegExp(r'[0-9]'));
    bool hasSymbol = password.contains(RegExp(r'[!@#\$%^&*()_+{}[\]|;:,.<>?]'));

    int strengthPoints = 0;
    if (hasUpper) strengthPoints++;
    if (hasLower) strengthPoints++;
    if (hasNumber) strengthPoints++;
    if (hasSymbol) strengthPoints++;

    if (password.length > 12 && strengthPoints == 4) return 'Very Strong';
    if (password.length >= 9 && strengthPoints >= 3) return 'Strong';
    if (password.length >= 6 && strengthPoints >= 2) return 'Normal';

    return 'Weak';
  }

  void copyToClipboard() {
    if (generatedPassword.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: generatedPassword.value));
      Get.snackbar(
        'Copied',
        'Password copied to clipboard',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        'No password generated',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
