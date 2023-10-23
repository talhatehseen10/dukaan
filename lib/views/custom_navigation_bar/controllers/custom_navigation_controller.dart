import 'package:dukaan/routes/routes.dart';
import 'package:get/get.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class CustomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool widgetRefresh = false.obs;
  RxList<String> sellerScreens = [
    AppRoutes.HOME,
    AppRoutes.CATEGORY,
    AppRoutes.ORDERS,
    AppRoutes.PROFILE
  ].obs;

  RxList<String> vendorScreens = [
    AppRoutes.HOME_VENDOR,
  ].obs;

  late LoginFormController loginController;

  @override
  void onInit() {
    loginController = Get.find<LoginFormController>();
    super.onInit();
  }

  changeScreen(int index) {
    widgetRefresh.value = true;
    selectedIndex.value = index;
    if (loginController.emailController.text == "vendor") {
      if (index == 2) {
        Get.offAndToNamed(AppRoutes.PRODUCT_VENDOR);
      } else if (index == 1) {
        Get.offAndToNamed(AppRoutes.ORDERS_VENDOR);
      } else {
        Get.offAndToNamed(vendorScreens[index]);
      }
    } else {
      Get.offAndToNamed(sellerScreens[index]);
    }
    widgetRefresh.value = false;
  }
}
