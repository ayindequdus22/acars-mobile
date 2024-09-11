import 'package:acars_mobile/constants/text.dart';
import 'package:acars_mobile/screens/auth_pages/login_page.dart';
import 'package:acars_mobile/screens/auth_pages/register_page.dart';
import 'package:acars_mobile/screens/home_page.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<void> main() async {
  await dotenv.load(fileName: ".env"); 
   WidgetsFlutterBinding.ensureInitialized();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeightWidth();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: CustomTextTheme().getTextTheme(context),
        scaffoldBackgroundColor:const Color.fromRGBO(4, 12, 24, 1),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        useMaterial3: true,
      ),
      initialRoute: "/login",
      getPages: [

       GetPage(name: "/", page:()=>const HomePage(),transition: Transition.cupertinoDialog,transitionDuration: const Duration(seconds: 1)),
    GetPage(name: "/login", page:()=>const LoginPage(),transition: Transition.cupertinoDialog,transitionDuration: const Duration(seconds: 1)),
       GetPage(name: "/register", page:()=>const RegisterPage(),transition: Transition.cupertinoDialog,transitionDuration: const Duration(seconds: 1)),
      ],

    );
  }
}

// http://localhost:7000/api/products/all-products