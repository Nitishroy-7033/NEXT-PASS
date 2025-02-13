
import '../../../core/constants/app_linker.dart';

class MasterPasswordController extends GetxController {
  var enteredPin = ''.obs;
  var enteredDigits = <String>[].obs; 
  final int pinLength = 4; 

  void addDigit(String digit) {
    if (enteredDigits.length < pinLength) { 
      enteredDigits.add(digit);
      enteredPin.value += digit;
    }
  }

  void removeDigit() {
    if (enteredDigits.isNotEmpty) { 
      enteredDigits.removeLast();
      enteredPin.value = enteredPin.value.substring(0, enteredPin.value.length - 1);
    }
  }

  bool isPinComplete() {
    return enteredDigits.length == pinLength; 
  }
}
