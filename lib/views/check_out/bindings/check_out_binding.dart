import 'package:dukaan/views/check_out/controllers/check_out_controller.dart';
import 'package:get/get.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutController());
  }
}
