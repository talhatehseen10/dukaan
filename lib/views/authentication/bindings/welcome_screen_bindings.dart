import 'package:get/get.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class WelcomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginFormController());
  }
}