import 'package:acars_mobile/constants/text.dart';
import 'package:acars_mobile/screens/auth_pages/login_page.dart';
import 'package:acars_mobile/screens/auth_pages/register_page.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<void> main() async {
  //  await dotenv.load(fileName: ".env");
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      getPages: [
       GetPage(name: "/", page:()=>const RegisterPage(),transition: Transition.cupertinoDialog,transitionDuration: const Duration(seconds: 1)),
       GetPage(name: "/login", page:()=>const LoginPage(),transition: Transition.cupertinoDialog,transitionDuration: const Duration(seconds: 1)),
       GetPage(name: "/register", page:()=>const RegisterPage(),transition: Transition.cupertinoDialog,transitionDuration: const Duration(seconds: 1)),
      ],

    );
  }
}

