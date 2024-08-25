import 'package:get/get.dart';

class SettingsController extends GetxController {
  var pushNotificationsEnabled = true.obs; // Observable boolean
  var limitNotificationSound = false.obs; // Observable boolean

  // Toggles for switches

  void togglePushNotifications(bool value) {
    pushNotificationsEnabled.value = value;
  }

  void toggleNotificationSound(bool value) {
    limitNotificationSound.value = value;
  }
}
