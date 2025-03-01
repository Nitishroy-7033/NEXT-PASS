import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  RxBool isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInternet();

    _subscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> _checkInternet() async {
    var result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      _showNoInternetSnackbar();
    } else {
      isConnected.value = true;
      Get.closeCurrentSnackbar(); // Close snackbar when internet is back
    }
  }

  void _showNoInternetSnackbar() {
    Get.rawSnackbar(
      message: "No internet connection. Please check your network.",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(days: 1), // Keep it open until manually closed
      mainButton: TextButton(
        onPressed: () => Get.closeCurrentSnackbar(),
        child: const Text("Dismiss", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
