import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    // Set the base URL for the HTTP client using dotenv
    httpClient.baseUrl = dotenv.env['API_URL'] ?? 'https://acars-backend.vercel.app';
    
    // Set the default content type for all requests
    httpClient.defaultContentType = 'application/json';
    
    // Add a request modifier to include additional headers
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    
    // Optionally, enable credentials
    // httpClient.withCredentials = true;
  }

  // Define the login function to send a POST request
  Future<Response> login(String email, String password) {
    final data = {
      "email": email,
      "password": password
    };
    String? api = dotenv.env['API_URL'];
    print(api);
    return post('${api}auth/login', data);
  }

  // Define the register function to send a POST request
  Future<Response> register(String username, String email, String password) {
    final data = {
      "email": email,
      "password": password,
      "username": username
    };
        // 'https://acars-backend.vercel.app/api/auth/register'
    return post('http://192.168.62.2/api/auth/register', data);
  }
}
