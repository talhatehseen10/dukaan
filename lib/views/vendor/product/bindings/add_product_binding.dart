import 'package:dukaan/views/vendor/product/controllers/add_product_controller.dart';
import 'package:get/get.dart';

class AddProductVendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }
}