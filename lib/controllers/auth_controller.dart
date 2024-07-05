import 'package:acars_mobile/constants/color.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:acars_mobile/utils/api_service.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginResponse = Rx<Map<String, dynamic>?>(null);

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final response = await ApiService.login(email, password);
    isLoading.value = false;
    loginResponse.value = response;
    
    if (response?['statusCode'] == 200) {
      // Handle successful login
      final body = response?['body'];
      final username = body?['username'];
      getSnack("Login Successfully", "Welcome back $username", AppColors.primary);
      Get.toNamed("/");
    } else {
      // Handle failed login
      final error = response?['error'] ?? 'Unknown error';
      getSnack("Login has Failed", error, Colors.red);
      if (kDebugMode) print('Login failed: $error');
    }
  }}
class RegisterController extends GetxController {
  var isLoading = false.obs;
  var registerResponse = Rx<Map<String, dynamic>?>(null);

  Future<void> register(String username, String email, String password) async {
    isLoading.value = true;
    final response = await ApiService.register(username, email, password);
    registerResponse.value = response;
    isLoading.value = false;
    if (response?['statusCode'] == 201) {
      // Handle successful registration
      getSnack("Account has been created", "", AppColors.primary);
      Get.toNamed("/login");
    } else {
      // Handle failed register
      getSnack("Couldn't create account Failed", "${response?['error']}",
          Colors.red);
      if (kDebugMode) print("Failed to create Accout: ${response?['error']}");
    }
  }
}

SnackbarController getSnack(String title, String response, Color color) {
  return Get.snackbar(
    "",
    "",
    dismissDirection: DismissDirection.horizontal,
    titleText: Text(
      title,
      style: TextStyle(fontSize: setHeight(20), color: Colors.white),
    ),
    messageText: Text(
      response,
      style: TextStyle(fontSize: setHeight(23), color: color),
    ),
    snackPosition: SnackPosition.BOTTOM,
    barBlur: 45,
    backgroundColor: const Color.fromRGBO(4, 12, 24, 1),
    maxWidth: double.infinity,
  );
}
