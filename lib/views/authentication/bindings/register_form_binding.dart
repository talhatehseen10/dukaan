import 'package:dukaan/views/authentication/controllers/register_form_controller.dart';
import 'package:get/get.dart';

class RegisterFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterFormController());
  }
}