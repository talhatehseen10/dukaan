import 'package:dukaan/routes/routes.dart';
import 'package:get/get.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class CustomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt lastRoute = 0.obs;
  RxBool widgetRefresh = false.obs;
  RxList<String> sellerScreens = [
    AppRoutes.HOME,
    AppRoutes.CATEGORY,
    AppRoutes.ORDERS,
    AppRoutes.PROFILE
  ].obs;

  RxList<String> vendorScreens = [
    AppRoutes.HOME_VENDOR,
    AppRoutes.ORDERS_VENDOR,
    AppRoutes.PRODUCT_VENDOR,
    AppRoutes.PROFILE,
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
      if (Get.currentRoute != vendorScreens[index]) {
        Get.offAndToNamed(vendorScreens[index]);
      }
    } else {
      if (Get.currentRoute != sellerScreens[index]) {
        Get.offAndToNamed(sellerScreens[index]);
      }
    }
    widgetRefresh.value = false;
  }
}
