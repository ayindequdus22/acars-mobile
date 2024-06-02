// ignore: file_names
import 'package:get/get.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    // Set the base URL for the HTTP client
httpClient.baseUrl = 'https://acars-backend.vercel.app';
    
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
    // 'https://acars-backend.vercel.app/api/auth/login'
    return post("http://192.168.62.2:7000/api/auth/login"
    , data);
  }


    // Define the login function to send a POST request

  Future<Response> register(String username,String email, String password) {
    final data = {
      "email": email,
      "password": password,
      "username": username
    };
    // 'https://acars-backend.vercel.app/api/auth/register'
    return post("http://192.168.62.2:7000/api/auth/register", data);
  }
}
