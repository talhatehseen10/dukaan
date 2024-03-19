import 'package:dukaan/views/seller/address/controllers/customer_address_controller.dart';
import 'package:get/get.dart';

class CustomerAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerAddressController());
  }
}
