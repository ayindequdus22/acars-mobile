import 'package:acars_mobile/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureMe = true;
    bool obscurePassword = true;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final TextEditingController confirmpasswordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/bg.png",
                height: 500,
                fit: BoxFit.cover,
              ),
           const   Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Text("Register into A-cars",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Email",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintStyle: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Username",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintStyle: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        obscureText: obscureMe,
                        style: const TextStyle(fontSize: 20),
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
                          hintStyle: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                 const SizedBox(height: 10),
                      SizedBox(
                      height: 60,
                      child: TextFormField(
                        obscureText: obscurePassword,
                        style: const TextStyle(fontSize: 20),
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
                          hintStyle: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                
                    const SizedBox(height: 10),
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
                            "Register Now",
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
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 70,
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
                          // fetch();
                        },
                        child: const Text(
                          "Login now",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
