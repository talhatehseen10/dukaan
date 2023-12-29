import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/authentication/views/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  //LoginModel? userLoginData;
  RxBool isLoading = false.obs;
  RxBool companyDataRefresh = false.obs;
  RxBool companyAPIError = false.obs;
  Map<String, dynamic>? selectedCompany;
  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  String? showSwitchTile;

  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    await BaseClient.safeApiCall(
      ApiConstants.REGISTER,
      RequestType.post,
      headers: await BaseClient.generateHeaders(),
      data: {
        "name": "admin",
        "phoneNumber": phoneController.text,
        "password": passwordController.text,
        "password_confirmation": passwordController.text
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
    isLoading.value = false;
    Get.to(() => const OtpAutoFill());
  }
}
