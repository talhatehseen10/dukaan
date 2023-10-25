import 'package:dukaan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/authentication/components/login_form.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class Login extends GetView<LoginFormController> {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/logo.svg",
                        height: Sizes.HEIGHT_68,
                        width: Sizes.WIDTH_68,
                        semanticsLabel: 'Gudam Logo')
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_58,
                ),
                Container(
                  height: Sizes.HEIGHT_40,
                  padding: const EdgeInsets.all(Sizes.PADDING_2),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDEEEF),
                    borderRadius: BorderRadius.circular(
                      Sizes.RADIUS_8,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: Sizes.WIDTH_150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              Sizes.RADIUS_8,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.LOG_IN_4,
                              style: context.bodySmall.copyWith(
                                  color: AppColors.black,
                                  fontSize: Sizes.TEXT_SIZE_14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.REGISTER);
                          },
                          child: Container(
                            height: Sizes.HEIGHT_28,
                            width: Sizes.WIDTH_150,
                            color: const Color(0xffEDEEEF),
                            child: Center(
                              child: Text(
                                AppStrings.REGISTER,
                                style: context.bodySmall.copyWith(
                                    color: AppColors.black,
                                    fontSize: Sizes.TEXT_SIZE_14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_24,
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
