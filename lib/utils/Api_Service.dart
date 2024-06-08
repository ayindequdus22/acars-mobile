import 'dart:convert';
import 'dart:developer';
import 'package:acars_mobile/models/auth_models.dart';
import 'package:acars_mobile/models/product_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;
final String apiUrl = dotenv.env['API_URL'] ?? '';

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse("${apiUrl}products/all-products"));
      if (response.statusCode == 200) {
        var json = response.body;
        return productFromJson(json);
      } else {
        log("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("My Error: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final data = LoginRequestModel(email: email, password: password);
      final response = await client.post(
        Uri.parse("${apiUrl}auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: loginToJson(data),
      );

        if (response.statusCode == 200) {
        // Successfully received response
        return {
          'statusCode': response.statusCode,
          'body': json.decode(response.body),
        };
      } else {
        // Handle non-200 status codes
        return {
          'statusCode': response.statusCode,
          'error': response.body,
        }; 
    }
    } catch (e) {
      // Handle errors
 return {
        'statusCode': 500,
        'error': 'Error occurred during login: $e',
      };
    }
  }
static Future<Map<String, dynamic>?> register(String username,String email, String password) async {
    try {
      final data = RegisterRequestModel(email: email,username: username, password: password);
      final response = await client.post(
        Uri.parse("${apiUrl}auth/register"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: registerToJson(data),
      );
          if (response.statusCode == 200) {
        // Successfully received response
        return {
          'statusCode': response.statusCode,
          'body': json.decode(response.body),
        };
      } else {
        // Handle non-200 status codes
        return {
          'statusCode': response.statusCode,
          'error': response.body,
        }; 
    }
    } catch (e) {
      // Handle errors
 return {
        'statusCode': 500,
        'error': 'Error occurred during Registration: $e',
      };
    }
  }
}

  