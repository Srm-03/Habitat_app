import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/navigation_mmenu.dart';

class SignupController extends GetxController {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  void signup() {
    createAccount(emailController.text, passwordController.text);
  }

  Future<void> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Account created");

      Get.offAll(const NavigationMenu());
      Get.snackbar("Welcome", "your account Has Created Sucessfully",
          duration: Duration(seconds: 5));
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "Weak-password") {
        print("Weak password");
      } else if (ex.code == "email-already-in-use") {
        print("Email in use use another email");
      }
      print("");
    } catch (ex) {
      print(ex);
      Get.snackbar("Oh Snap", ex.toString());
    }
  }
}
