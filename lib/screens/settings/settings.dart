import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/onboarding/login/login_controller.dart';
import 'package:habitat_app/screens/settings/settings__controller.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    final logincontroller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Iconsax.notification),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Account Section
          Text(
            'Account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: Text('Personal Info'),
            onTap: () {
              // Navigate to Personal Info screen
            },
            trailing: Icon(Iconsax.arrow_right),
          ),
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Navigate to Change Password screen
            },
            trailing: Icon(Iconsax.arrow_right),
          ),
          ListTile(
            title: Text('Security and Login'),
            onTap: () {
              // Navigate to Security and Login screen
            },
            trailing: Icon(Iconsax.arrow_right),
          ),
          SizedBox(height: 24),

          // Notifications Section
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(() => SwitchListTile(
                title: Text('Push Notifications'),
                value: controller.pushNotificationsEnabled.value,
                onChanged: controller.togglePushNotifications,
              )),
          Obx(() => SwitchListTile(
                title: Text('Sound Notification'),
                value: controller.limitNotificationSound.value,
                onChanged: controller.toggleNotificationSound,
              )),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              logincontroller.logout();
              // Navigate to Personal Info screen
            },
            trailing: Icon(Iconsax.logout_14),
          ),
        ],
      ),
    );
  }
}
