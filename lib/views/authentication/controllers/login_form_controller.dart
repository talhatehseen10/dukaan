import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dukaan/constants/constants.dart';
// import 'package:dukaan/routes/app_routes.dart';
// import 'package:dukaan/services/api/api_constants.dart';
//import 'package:dukaan/services/api/base_client.dart';

class LoginFormController extends GetxController {
  final box = GetStorage(AppStrings.COMPANY_ID);
  //LoginModel? userLoginData;
  RxBool isLoading = false.obs;
  RxBool companyDataRefresh = false.obs;
  RxBool companyAPIError = false.obs;
  Map<String, dynamic>? selectedCompany;
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController tokenController;
  String? showSwitchTile;
  
  // @override
  // void onInit() {
  //   selectedCompany = box.read(AppStrings.COMPANY_ID);
  //   emailController = TextEditingController(text: "john.doe@example.com");
  //   passwordController = TextEditingController(text: "password1");
  //   tokenController = TextEditingController();
  //   super.onInit();
  // }

  // Future<void> userLogin() async {
  //   await BaseClient.safeApiCall(
  //     ApiConstants.LOGIN,
  //     RequestType.post,
  //     headers: await BaseClient.generateHeaders(),
  //     data: {
  //       "email": emailController.text.trim(),
  //       "password": passwordController.text
  //     },
  //     onSuccess: (response) {
  //       addUserLoginData(response.data);
  //     },
  //     onLoading: () {
  //       isLoading.value = true;
  //     },
  //     onError: (e) {
  //       isLoading.value = false;
  //     },
  //   );
  // }

  // void addUserLoginData(Map<String, dynamic> data) {
  //   isLoading.value = true;
  //   userLoginData = LoginModel.fromJson(data);
  //   selectedCompany = {
  //     "id": companyData!.sandbox![0].id,
  //     "initial": companyData!.sandbox![0].nameInitials,
  //     "environment": companyData!.sandbox![0].environment,
  //   };
  //   isLoading.value = false;
  //   Get.toNamed(AppRoutes.SALES_ORDER);
  // }

  
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Config config = Config(
  //   tenant: "a8f1a5f9-f8b8-400c-87a1-a704be2d7dc2",
  //   clientId: "3ae10ffe-fae6-48aa-aedb-15f3ca2d9c6d",
  //   clientSecret: "Gkl8Q~-_GQoUqfgQIgOVmkpMbyBkC5GD5NUqlcua",
  //   scope: "https://api.businesscentral.dynamics.com/.default",
  //   // redirectUri is Optional as a default is calculated based on app type/web location
  //   redirectUri: "https://l.rs74.net/callback",
  //   customParameters: {},
  //   navigatorKey: Get.key,
  //   webUseRedirect:
  //       true, // default is false - on web only, forces a redirect flow instead of popup auth
  //   //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
  //   loader: const Center(
  //     child: CircularProgressIndicator(),
  //   ),
  // );

  // late AadOAuth oauth;

  // void selectCompany(CompanyValue companyValue) {
  //   companyDataRefresh.value = true;
  //   selectedCompany = {
  //     "id": companyValue.id,
  //     "initial": companyValue.nameInitials,
  //     "environment": companyValue.environment
  //   };
  //   box.write(AppStrings.COMPANY_ID, selectedCompany);
  //   Get.offAllNamed(AppRoutes.SALES_ORDER);
  //   companyDataRefresh.value = false;
  // }
}
