import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/onboarding/forgotpassword/authenticate_password.dart';
import 'package:lottie/lottie.dart';

class Emailverification extends StatelessWidget {
  const Emailverification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/message_sent.json",
                  height: 200, fit: BoxFit.contain),
              TextField(
                // controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const AuthenticatePassword()),
                    child: const Text("Ok")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
