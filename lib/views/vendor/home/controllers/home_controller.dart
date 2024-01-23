import 'package:dukaan/views/custom_navigation_bar/controllers/custom_navigation_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late CustomNavigationController customNavigationController;
  
  @override
  void onInit() {
    customNavigationController = Get.find<CustomNavigationController>();
    super.onInit();
  }
}
