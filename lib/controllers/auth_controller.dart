import 'package:acars_mobile/utils/Api_Service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final ApiService apiService = ApiService();


  Future<void> login(String username, String password) async {
    try {
      final response = await apiService.login(username, password);
      print(response.body);
      
ScaffoldMessenger(child:
        SnackBar(content: Text("Flagged an error: ${response.statusText}")));
      
      if (response.statusCode == 202) {
        // Handle successful login
        Get.toNamed("/register");
        if (kDebugMode) {
          print("Login successful: ${response.body}");
        }
      } else {
        // Handle login failure
        if (kDebugMode) {
          print("Login failed: ${response.statusText}");
        }
      }
    } catch (e) {
      // Handle error
      print("Error during login: $e");
    }
  }
  Future<void> register(String username,String email, String password) async {
    try {
      final response = await apiService.register(username,email, password);
      if (response.statusCode == 200) {
        // Handle successful login
        print("Account created Successfully ${response.body}");
      } else {
        // Handle login failure

        SnackBar(content: Text("Flagged an error: ${response.statusText}"));
      

        // if (kDebugMode) {
        // print(" ${response.body}");
        //   print("Couldn't create Account ${response.statusText}");
        // }
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print("Error during login: $e");
      }
    }
  }
}
