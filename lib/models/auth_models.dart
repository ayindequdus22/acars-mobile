import 'dart:convert';

String productToJson(List<LoginRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginRequestModel {
  final String email;
  final String password;
  LoginRequestModel({required this.email, required this.password});
  
 
  Map<String, dynamic> toJson() => {
      "email":email,
      "password":password
      };
}

// register_request.dart
class RegisterRequest {
  final String username;
  final String email;
  final String password;

  RegisterRequest({required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
