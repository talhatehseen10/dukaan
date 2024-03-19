import 'package:dukaan/views/seller/my_bag/controllers/my_bag_controller.dart';
import 'package:get/get.dart';

class MyBagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyBagController());
  }
}
