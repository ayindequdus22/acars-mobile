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
                  Column(
                    children: [
                      SizedBox(
                        height: setHeight(80),
                        child: TextFormField(controller: emailController,
                          style: TextStyle(
                            fontSize: setHeight(30),
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintStyle: TextStyle(
                              fontSize: setHeight(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: setHeight(10)),
                      SizedBox(
                        height: setHeight(80),
                        child: TextFormField(controller: usernameController,
                          style: TextStyle(fontSize: setHeight(30)),
                          decoration: InputDecoration(
                            hintText: "Username",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintStyle: TextStyle(
                              fontSize: setHeight(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: setHeight(10)),
                      SizedBox(
                        height: setHeight(80),
                        child: TextFormField(
                          obscureText: obscureMe,
                          style: TextStyle(fontSize: setHeight(30)),controller: passwordController,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10),
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureMe = !obscureMe;
                                });
                              },
                              icon: Icon(obscureMe
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: "Password",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintStyle: TextStyle(fontSize: setHeight(30)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: setHeight(80),
                        child: TextFormField(controller: confirmpasswordController,
                          obscureText: obscurePassword,
                          style:  TextStyle(fontSize: setHeight(30)),
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10),
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: Icon(obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: "Confirm Password",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintStyle: TextStyle(fontSize: setHeight(30)),
                          ),
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
                                color: const Color.fromRGBO(255, 255, 255, 0.671),
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
                            backgroundColor:
                                const WidgetStatePropertyAll(AppColors.primary),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
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
                ],
              ),
            ),
          ],
                ),
              ),
        ));
  }
}
