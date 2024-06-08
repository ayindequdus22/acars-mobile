import 'package:acars_mobile/constants/color.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:acars_mobile/utils/Api_Service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginResponse = Rx<Map<String, dynamic>?>(null);

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final response = await ApiService.login(email, password);
    loginResponse.value = response;
    isLoading.value = false;
   if (response?['statusCode'] == 200) {
      // Handle successful login
      loginResponse.value = response?['body'];
   final username = response?['body']?['username'];
      // Store token and navigate
    final token = response?['body']?['token'];

      if (token != null && token is String) {
        getSnack("Login Successfully", "Welcome back $username", AppColors.primary);

        // Store token and navigate
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", token);
        Get.toNamed("/products");
      } else {
        // Handle missing token
        getSnack("Login Failed", "Token is missing from response", Colors.red);
        if(kDebugMode)  print('Login failed: Token is missing from response');
      }
    } else {
      // Handle failed login
      getSnack("Login Failed", "${response?['error']}", Colors.red);
      if(kDebugMode)  print('Login failed: ${response?['error']}');
    }
    }
}
class RegisterController extends GetxController {
  var isLoading = false.obs;
  var registerResponse = Rx<Map<String, dynamic>?>(null);

  Future<void> register(String email, String password,String username) async {
    isLoading.value = true;
    final response = await ApiService.register(email,username, password);
    registerResponse.value = response;
    isLoading.value = false;
 if (response?['statusCode'] == 201) {
      // Handle successful registration
      getSnack("Account has been created", "", AppColors.primary);
      Get.toNamed("/login");
    } else {
      // Handle failed register
      getSnack("Couldn't create account Failed", "${response?['error']}", Colors.red);
      if(kDebugMode)  print('Login failed: ${response?['error']}');
    }
  }
}

  SnackbarController getSnack(String title,String response, Color color) {
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
