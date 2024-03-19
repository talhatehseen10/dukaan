import 'package:dukaan/views/seller/home/controllers/see_all_controller.dart';
import 'package:get/get.dart';

class SeeAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeeAllController());
  }
}
