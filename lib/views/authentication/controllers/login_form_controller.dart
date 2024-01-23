import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/authentication/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dukaan/constants/constants.dart';

class LoginFormController extends GetxController {
  final box = GetStorage(AppStrings.COMPANY_ID);
  LoginModel? userLoginData;
  RxBool isLoading = false.obs;
  RxBool isVendor = false.obs;
  RxBool companyDataRefresh = false.obs;
  RxBool companyAPIError = false.obs;
  Map<String, dynamic>? selectedCompany;
  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController tokenController;
  RxBool isObscureText = true.obs;
  String? showSwitchTile;

  @override
  void onInit() {
    phoneController = TextEditingController(text: "03123123123");
    passwordController = TextEditingController(text: "seller123");
    super.onInit();
  }

  Future<void> userLogin() async {
    await BaseClient.safeApiCall(
      ApiConstants.LOGIN,
      RequestType.post,
      headers: await BaseClient.generateHeaders(),
      data: {
        "phoneNumber": phoneController.text,
        "password": passwordController.text
      },
      onSuccess: (response) {
        addUserLoginData(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  void addUserLoginData(Map<String, dynamic> data) {
    isLoading.value = true;
    userLoginData = LoginModel.fromJson(data);
    isLoading.value = false;
    if (userLoginData!.data!.role!.toLowerCase() == "vendor") {
      Get.toNamed(AppRoutes.HOME_VENDOR);
    } else {
      Get.toNamed(AppRoutes.HOME);
    }
  }

  // void loginUser() {
  //   if (emailController.text.toLowerCase() == "seller" &&
  //       passwordController.text.toLowerCase() == "seller") {
  //     Get.toNamed(AppRoutes.HOME);
  //   } else if (emailController.text.toLowerCase() == "vendor" &&
  //       passwordController.text.toLowerCase() == "vendor") {
  //     Get.toNamed(AppRoutes.HOME_VENDOR);
  //   }
//  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
