import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profilePicture = ''.obs; // URL or path to the profile picture
  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var emailController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var selectedGender = 'Male'.obs; // Default to 'Male'

  List<String> genderOptions = ['Male', 'Female', 'Other'];
}
