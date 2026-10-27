import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  // Mock Login Function (Jab backend API aa jaye gi toh yahan API call ajaye gi)
  void loginWithProvider(String provider) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 15)); // 1.5 seconds mock delay
    isLoading.value = false;

    // Success hone par bottom sheet close kar dein
    Get.back();
    
    Get.snackbar(
      'Success',
      'Successfully logged in via $provider!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void loginWithEmailOrPhone(String input, String password) async {
    if (input.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 15));
    isLoading.value = false;

    Get.back();
    Get.snackbar(
      'Success',
      'Logged in successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}