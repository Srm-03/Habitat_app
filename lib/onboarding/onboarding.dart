import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/common/hsocial_button.dart';
import 'package:habitat_app/onboarding/login/login.dart';
import 'package:habitat_app/onboarding/signup/signup.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),

                child: RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Monitor And Improve Your habit with",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '  HABITAT',
                      style: TextStyle(
                          color: Color(0xFF69F0AE),
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                // child: RichText(
                //     text: TextSpan(children: [
                //   TextSpan(
                //     text: "Monitor And Improve Your habit with Habitat",
                //     style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                //   )
                // ])),
              ),
              Lottie.asset(
                "assets/lottie/lottie_running.json",
                height: 250,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: const Text("Continue With Email")),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text("Create An Account")),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Or continue with"),
              SizedBox(
                height: 30,
              ),
              HsocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
