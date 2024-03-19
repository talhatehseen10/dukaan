import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';
import 'package:dukaan/widgets/custom_widgets/loading_dialog.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isProgressBarView = false.obs;
  RxBool isLoading = false.obs;
  late LoginFormController loginFormController;

  @override
  void onInit() {
    loginFormController = Get.find<LoginFormController>();
    super.onInit();
  }

  Future<void> logout() async {
    await BaseClient.safeApiCall(
      ApiConstants.LOGOUT,
      RequestType.post,
      headers: await BaseClient.generateHeadersWithToken(
          token: loginFormController.userLoginData!.data!.token),
      onSuccess: (response) {
        if (response.data["success"]) {
          Get.back();
          Get.back();
        }
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        Get.back();
        isLoading.value = false;
      },
    );
  }

  void userLogout() {
    loadingDialog("Loging Out");
    logout();
  }
}
