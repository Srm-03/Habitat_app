import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/common/hsocial_button.dart';
import 'package:habitat_app/onboarding/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 250,
                    child: Image.asset(
                      "assets/logo/h_logo_white.png",
                      fit: BoxFit.cover,
                    )),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Enter your details to log into the application",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: const Text("Login")),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(onPressed: () {}, child: Text("Forgot Password")),
                SizedBox(
                  height: 10,
                ),
                Text("Or continue with"),
                SizedBox(
                  height: 10,
                ),
                HsocialButton(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    TextButton(
                        onPressed:
                            () {}, //=> Get.to(() => const SignupScreen()),
                        child: Text("Signup"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
