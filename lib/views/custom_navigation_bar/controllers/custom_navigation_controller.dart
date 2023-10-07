import 'package:dukaan/routes/routes.dart';
import 'package:get/get.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class CustomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool widgetRefresh = false.obs;
  RxList<String> screens = [
    AppRoutes.HOME,
    AppRoutes.CATEGORY,
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
    Get.toNamed(screens[index]);
    widgetRefresh.value = false;
  }
}
