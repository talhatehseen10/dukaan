import 'package:dukaan/views/vendor/orders/controllers/orders_controller.dart';
import 'package:get/get.dart';

class OrderVendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersController());
  }
}
