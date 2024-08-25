import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/screens/Profile/profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            controller.profilePicture.value.isNotEmpty
                                ? NetworkImage(controller.profilePicture.value)
                                : AssetImage('assets/img/profile.jpg')
                                    as ImageProvider,
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Action to edit the profile picture
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Name TextField
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Surname TextField
            TextField(
              controller: controller.surnameController,
              decoration: InputDecoration(
                labelText: 'Surname',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Email TextField
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Date of Birth TextField
            TextField(
              controller: controller.dateOfBirthController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                // DatePicker logic can be added here
              },
            ),
            SizedBox(height: 16),

            // Gender Switch
            Obx(() => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  value: controller.selectedGender.value,
                  items: controller.genderOptions.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    controller.selectedGender.value = newValue!;
                  },
                )),
            SizedBox(height: 24),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save action
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
