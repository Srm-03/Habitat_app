import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/screens/Profile/profile.dart';
import 'package:habitat_app/screens/add_habits/habits.dart';
import 'package:habitat_app/screens/homescreens/homescreen.dart';
import 'package:habitat_app/screens/settings/settings.dart';
import 'package:habitat_app/screens/statistics/statistics.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.3),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home5), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.add5), label: 'Habits'),
            NavigationDestination(
                icon: Icon(Iconsax.graph5), label: 'Statistics'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.settings5), label: 'Settings'),
          ],
        ), // NavigationBar
      ), // Obx
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
} // Scaffold

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const Homescreen(),
    const HabitDetailScreen(),
    Statistics(),
    const ProfileScreen(),
    const SettingsPage(),
  ];
}
