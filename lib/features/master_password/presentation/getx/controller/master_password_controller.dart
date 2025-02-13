
import '../../../../../core/constants/app_linker.dart';

class MasterPasswordController extends GetxController {
  var enteredPin = ''.obs;
  var enteredDigits = <String>[].obs; // ✅ List to store entered digits
  final int pinLength = 4; // Adjust as needed

  void addDigit(String digit) {
    if (enteredDigits.length < pinLength) { // ✅ Check list length
      enteredDigits.add(digit);
      enteredPin.value += digit;
    }
  }

  void removeDigit() {
    if (enteredDigits.isNotEmpty) { // ✅ Remove last element safely
      enteredDigits.removeLast();
      enteredPin.value = enteredPin.value.substring(0, enteredPin.value.length - 1);
    }
  }

  bool isPinComplete() {
    return enteredDigits.length == pinLength; // ✅ Check list length
  }
}
