import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:habitat_app/navigation_mmenu.dart';
import 'package:habitat_app/onboarding/login/login.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxString userMobileNumber = "".obs;
  RxString username = "".obs;
  RxString useremail = "".obs;

  void login() {
    loginWithEmailAndPassword(emailController.text, passwordController.text);
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Welcome", "You are login sucesfully");
      Get.offAll(NavigationMenu());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        print("");
        Fluttertoast.showToast(
            msg: "Email id not exist", backgroundColor: Colors.blue);
      } else if (ex.code == "wrong-password") {
        print("Wrong password");
        Fluttertoast.showToast(
            msg: "Wrong password", backgroundColor: Colors.blue);
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginScreen());
  }

  User? users = FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    super.onInit();
    getuserdata();
  }

  void getuserdata() {
    if (users != null) {
      userMobileNumber.value = users!.phoneNumber ?? "".toString();
      useremail.value = users!.email ?? "".toString();
      username.value = users!.displayName ?? "".toString();
    }
  }
}
