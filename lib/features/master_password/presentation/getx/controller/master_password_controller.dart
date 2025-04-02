import '../../../../../core/constants/app_linker.dart';
class MasterPasswordController extends GetxController {
  RxString enteredDigits = ''.obs;
  RxBool isCreatingPin = false.obs; // PIN creation mode
  var tempPin = RxnString(); // ✅ Correct way to make it reactive
  // Temporary PIN for confirmation
  final int pinLength = 4;
  RxString errorMessage = ''.obs;  // 🔹 Error message variable


  @override
  void onInit() {
    super.onInit();
    loadSavedPin(); // ✅ Load existing PIN on app start
  }

  // ✅ Function to handle PIN entry
  void updatePin(String value) async {
    if (enteredDigits.value.length < pinLength) {
      enteredDigits.value += value;
      // 🔥 **Console pe entered PIN dikhane ke liye print** 
      print("Entered PIN: ${enteredDigits.value}");

      if (enteredDigits.value.length == pinLength) {
        if (isCreatingPin.value) {
          handlePinCreation();
        } else {
          validatePin();
        }
      }
    }
  }

  void handlePinCreation() async {
    print("DEBUG: handlePinCreation() called");
    print("DEBUG: Current tempPin = ${tempPin.value}");
    print("DEBUG: Entered PIN = ${enteredDigits.value}");

    if (tempPin.value == null) {
      tempPin.value = enteredDigits.value; // First PIN entry
      enteredDigits.value = ''; // Reset for re-entry
      print("✅ First PIN entered: ${tempPin.value}");
    } else {
      if (tempPin.value == enteredDigits.value) {
        await savePin(enteredDigits.value);
        isCreatingPin.value = false; // Exit creation mode
        print("✅ PIN successfully created and stored!");
      } else {
       errorMessage.value = "PINs do not match! Try again."; // ✅ UI pe error dikhega

        print("❌ PIN did not match, please try again!");
      }

      // Reset tempPin and enteredDigits
      tempPin.value = null;  // ✅ Correct way to reset RxnString
      enteredDigits.value = '';
    }

    // 🔥 UI update force karne ke liye
    isCreatingPin.refresh();
    tempPin.refresh(); // ✅ Ensure UI updates
    print("DEBUG: After handlePinCreation -> isCreatingPin = ${isCreatingPin.value}, tempPin = ${tempPin.value}");
  }


  // ✅ Validate entered PIN
  Future<void> validatePin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPin = prefs.getString('saved_pin');

    if (savedPin == enteredDigits.value) {
      errorMessage.value = '';  // 🔹 Reset error on success

      print("✅ Correct PIN Entered: ${enteredDigits.value}"); // 🔥 Console pe print
        Future.delayed(Duration(milliseconds: 300), () {
    Get.offAllNamed(AppRoutes.home);
});

      // Proceed to next screen
    } else {
          print("❌ Incorrect PIN: ${enteredDigits.value}"); // 🔥 Console pe print
          errorMessage.value = "Incorrect PIN, please try again.";  // 🔥 Error message set karo

      enteredDigits.value = ''; // Reset input
    }
  }

  // ✅ Save PIN in SharedPreferences
  Future<void> savePin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_pin', pin);
        print("✅ PIN Stored in SharedPreferences: $pin"); // 🔥 Console pe print

  }
  
// ✅ Load saved PIN (if exists)
Future<void> loadSavedPin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedPin = prefs.getString('saved_pin');

  if (savedPin == null) {
    isCreatingPin.value = true; 
    isCreatingPin.refresh();  // ✅ Ensure UI updates
    print("⚠️ No PIN found, switching to creation mode!");
  } else {
    isCreatingPin.value = false;
    isCreatingPin.refresh();  // ✅ Ensure UI updates
    print("✅ PIN found in storage: $savedPin");
  }
}

 void addDigit(String digit) {
    updatePin(digit); //
  }

void removeDigit() {
  if (enteredDigits.value.isNotEmpty) {
    enteredDigits.value = enteredDigits.value.substring(0, enteredDigits.value.length - 1);
  }
}
// 
  void onPinEntered() {
  if (enteredDigits.value.length == pinLength) {
    if (isCreatingPin.value) {
      handlePinCreation();
    } else {
      validatePin();
    }
  }
}
 Future<void> resetMasterPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_pin'); // ❌ Delete stored PIN

    enteredDigits.value = '';  // Reset PIN entry
    tempPin.value = null;
    isCreatingPin.value = true; // Switch to PIN creation mode

    isCreatingPin.refresh();
    tempPin.refresh();

    print("🔄 Master PIN has been reset. User needs to create a new PIN.");
    Get.offAllNamed(AppRoutes.masterPassword); // Redirect to Set New PIN Screen
  }

}

