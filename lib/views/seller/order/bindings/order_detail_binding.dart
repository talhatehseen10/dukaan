import 'package:dukaan/views/seller/order/controllers/order_detail_controller.dart';
import 'package:get/get.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailController());
  }
}
