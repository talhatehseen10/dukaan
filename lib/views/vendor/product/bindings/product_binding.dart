import 'package:dukaan/views/vendor/product/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductVendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
