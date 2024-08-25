import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/onboarding/login/login_controller.dart';
import 'package:iconsax/iconsax.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Iconsax.edit),
            onPressed: () => Get.to(() => const EditProfilePage()),
          ),
          IconButton(
            icon: Icon(Iconsax.notification),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/img/profile.jpg'),
            ),
            SizedBox(height: 16),
            Obx(
              () => Text(
                controller.username.trim(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 8),
            Obx(
              () => Text(
                controller.useremail.trim(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "203",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Iconsax.cake)
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Day With Habitat',
                        style: TextStyle(fontSize: 15),
                      ),

                      // Additional info can be added here
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "203",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Iconsax.heart)
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Completed Habbits',
                        style: TextStyle(fontSize: 15),
                      ),

                      // Additional info can be added here
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Male', // or 'Female'
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Date of Birth: 01/01/1990',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                // Delete account action
              },
              child: Text(
                'Delete Account',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
