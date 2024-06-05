import 'package:acars_mobile/constants/color.dart';
import 'package:acars_mobile/controllers/auth_controller.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureMe = true;
  final AuthController authController = Get.put(AuthController());
  
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateUser(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty";
    }
    if (!value.isEmail) {
      return "Invalid email";
    }
    return null;
  }
 String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length <8 || value.length >20) {
      return "Password must have 8-20 characters";
    }
    return null;
  }
//  ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Flagged an error: ${response.statusText}")),
    //   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/bg.png",
     height: setHeight(600),
                fit: BoxFit.cover,
              ),
               const Text(
                "Login into A-cars",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        style:  TextStyle(fontSize: setHeight(29)),
                        validator: validateUser,
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintStyle:  TextStyle(fontSize: setHeight(30)),
                        ),
                      ),
                       SizedBox(height: setHeight(10)),
                   
                      TextFormField(
                        controller: passwordController,
                        obscureText: obscureMe,
                        style:  TextStyle(fontSize: setHeight(29)),
                        obscuringCharacter: "*",
                        validator: validatePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffix: 
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureMe = !obscureMe;
                              });
                            },
                            child: Icon(obscureMe
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintStyle:  TextStyle(fontSize: setHeight(30)),
                        ),
                      ),

                       SizedBox(height: setHeight(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed("/register");
                            },
                            child: Text(
                              "Register Now",
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.fontSize,
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.671),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.fontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: setHeight(10)),
                      SizedBox(
                        width: double.infinity,
                        height: setHeight(70),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(AppColors.primary),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                               authController.login(emailController.text, passwordController.text);
                              print("Herlo");
                            }
                          },
                          child: const Text(
                            "Login now",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                       SizedBox(height: setHeight(20)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
