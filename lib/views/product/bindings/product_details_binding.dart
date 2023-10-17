import 'package:dukaan/views/product/controllers/product_details_controller.dart';
import 'package:get/get.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
