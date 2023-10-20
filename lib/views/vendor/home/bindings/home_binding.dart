import 'package:dukaan/views/vendor/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeVendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
