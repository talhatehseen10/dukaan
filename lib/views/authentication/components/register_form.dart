import 'package:dukaan/views/authentication/controllers/register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/themes.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';

class RegisterForm extends GetView<RegisterFormController> {
  const RegisterForm({super.key});

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
                  controller: controller.emailController,
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
                CustomTextField(
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  fillColor: Colors.white,
                  hintText: AppStrings.PASSWORD_HINT_TEXT,
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    size: Sizes.ICON_SIZE_24,
                  ),
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
                      AppStrings.CONFIRM_PASSWORD,
                      style: context.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  fillColor: Colors.white,
                  hintText: AppStrings.PASSWORD_HINT_TEXT,
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    size: Sizes.ICON_SIZE_24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_40,
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
                            if (controller.formKey.currentState!.validate()) {}
                          },
                          text: AppStrings.REGISTER,
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
