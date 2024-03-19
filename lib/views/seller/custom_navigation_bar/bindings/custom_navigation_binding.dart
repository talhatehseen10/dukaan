import 'package:get/get.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/controllers/custom_navigation_controller.dart';

class CustomNavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomNavigationController());
  }
}
