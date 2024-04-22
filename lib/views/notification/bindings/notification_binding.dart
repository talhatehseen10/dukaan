import 'package:dukaan/views/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
