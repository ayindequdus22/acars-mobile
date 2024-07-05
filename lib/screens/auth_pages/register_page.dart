import 'package:acars_mobile/constants/color.dart';
import 'package:acars_mobile/controllers/auth_controller.dart';
import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final RegisterController registerController = Get.put(RegisterController());

class _RegisterPageState extends State<RegisterPage> {
  bool obscureMe = true;
  bool obscurePassword = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmpasswordController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    if (!value.isEmail || value.length < 12 || value.length >= 30) {
      return "Invalid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 8 || value.length > 20) {
      return "Password must have 8-20 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Password and Confirm Password must be equal";
    }

    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty";
    }
    if (value.length < 4 || value.length > 30) {
      return "Password must have 4-30 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Image.asset(
              "assets/bg.png",
              height: setHeight(500),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(
                setHeight(10),
              ),
              child: Column(
                children: [
                  Text("Register into A-cars",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: setHeight(40),
                      )),
                  SizedBox(
                    height: setHeight(10),
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                       
                      TextFormField(
                          controller: usernameController,
                          style: TextStyle(fontSize: setHeight(29)),
                          validator: validateUsername,
                          decoration: InputDecoration(
                            hintText: "Username",
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintStyle: TextStyle(fontSize: setHeight(30)),
                          ),
                        ),SizedBox(height: setHeight(10)),
                          TextFormField(
                          controller: emailController,
                          style: TextStyle(fontSize: setHeight(29)),
                          validator: validateEmail,
                          decoration: InputDecoration(
                            hintText: "Email",
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintStyle: TextStyle(fontSize: setHeight(30)),
                          ),
                        ),

                        
                        SizedBox(height: setHeight(10)),
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscureMe,
                          style: TextStyle(fontSize: setHeight(29)),
                          obscuringCharacter: "*",
                          validator: validatePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffix: GestureDetector(
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
                            hintStyle: TextStyle(fontSize: setHeight(30)),
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          controller: confirmpasswordController,
                          obscureText: obscurePassword,
                          style: TextStyle(fontSize: setHeight(29)),
                          obscuringCharacter: "*",
                          validator: validateConfirmPassword,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
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
                            hintStyle: TextStyle(fontSize: setHeight(30)),
                          ),
                        ),
                        SizedBox(height: setHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                "Have an Account?",
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.fontSize,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.671),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed("/login");
                              },
                              child: Text(
                                "Login",
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
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColors.primary),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                final email = emailController.text;
                                final username = usernameController.text;
                                final password = passwordController.text;
                                FocusScope.of(context).unfocus();
                                registerController.register(
                                   username, email, password );
                              }
                            },
                            child: Text(
                              "Register now",
                              style: TextStyle(
                                  color: Colors.white, fontSize: setHeight(28)),
                            ),
                          ),
                        ),
                        SizedBox(height: setHeight(25)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
