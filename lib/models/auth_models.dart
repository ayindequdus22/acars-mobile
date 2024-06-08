import 'dart:convert';

class LoginRequestModel {
  final String email;
  final String password;
  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

String loginToJson(LoginRequestModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
// register_request.dart
class RegisterRequestModel {
  final String username;
  final String email;
  final String password;

  RegisterRequestModel({required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
String  registerToJson(RegisterRequestModel data){
final jsonData = data.toJson();
return jsonEncode(jsonData);
}




