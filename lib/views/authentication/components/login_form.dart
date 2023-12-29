import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/themes.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';

class LoginForm extends GetView<LoginFormController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final statusBarHeight = Get.statusBarHeight;

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.PHONE_NO,
                      style: context.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                CustomTextField(
                  controller: controller.phoneController,
                  keyboaredtype: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  fillColor: Colors.white,
                  hintText: AppStrings.PHONE_HINT_TEXT,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_24,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.PASSWORD,
                      style: context.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                Obx(
                  () => CustomTextField(
                    height: Sizes.HEIGHT_56,
                    controller: controller.passwordController,
                    isObscureText: controller.isObscureText.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    fillColor: Colors.white,
                    hintText: AppStrings.PASSWORD_HINT_TEXT,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isObscureText.value =
                            !controller.isObscureText.value;
                      },
                      child: Icon(
                        controller.isObscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: Sizes.ICON_SIZE_24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_24),
            child: Text(
              AppStrings.FORGOT_PASSWORD,
              style: context.bodySmall.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.primaryColor,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          height: Sizes.HEIGHT_56,
                          screenHeight: screenHeight,
                          statusBarHeight: statusBarHeight,
                          fontColor: AppColors.white,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.userLogin();
                            }
                          },
                          text: AppStrings.LOG_IN,
                          backgoundColor: LightTheme.buttonBackgroundColor2,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
