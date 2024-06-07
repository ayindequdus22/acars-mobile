
import 'package:acars_mobile/models/auth_models.dart';
import 'package:acars_mobile/models/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;
 
// class ApiService extends GetConnect {
//  ;

//   @override
//   void onInit() {
//     httpClient.baseUrl = apiUrl;
//     httpClient.defaultContentType = 'application/json';

//     httpClient.addRequestModifier<void>((request) {
//       request.headers['Accept'] = 'application/json';
//       return request;
//     });

//     // Optionally, enable credentials
//     // httpClient.withCredentials = true;
//   }

//   Future<Response> login(LoginRequest loginRequest) async {
//     try {
//       final response = await post('auth/login', loginRequest.toJson());
//       return response;
//     } catch (e) {
//       return Response(statusCode: 500, statusText: 'Error: $e');
//     }
//   }

//   Future<Response> register(RegisterRequest registerRequest) async {
//     try {
//       final response = await post('auth/register', registerRequest.toJson());
//       return response;
//     } catch (e) {
//       return Response(statusCode: 500, statusText: 'Error: $e');
//     }
//   }
//     Future<bool> validateToken(String token) async {
//     final response = await get('auth/myprofile', headers: {
//       'Authorization': 'Bearer $token',
//     });
// print(response);
//     if (response.statusCode == 202) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
final String apiUrl = dotenv.env['API_URL'] ?? '';

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse("${apiUrl}products/all-products"));
      if (response.statusCode == 200) {
        var json = response.body;
        return productFromJson(json);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("My Error: $e");
      return null;
    }
  }
}