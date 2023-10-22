import 'package:dukaan/views/authentication/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class Register extends GetView<LoginFormController> {
  static const String routeName = '/register';
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: Sizes.WIDTH_320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/logo.svg",
                          height: Sizes.HEIGHT_60,
                          width: Sizes.WIDTH_60,
                          semanticsLabel: 'Gudam Logo')
                    ],
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_66,
                  ),
                  Container(
                    height: Sizes.HEIGHT_30,
                    padding: const EdgeInsets.all(Sizes.PADDING_2),
                    decoration: BoxDecoration(
                      color: const Color(0xffEDEEEF),
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: Sizes.HEIGHT_28,
                            width: Sizes.WIDTH_150,
                            decoration: BoxDecoration(
                              color: const Color(0xffEDEEEF),
                              borderRadius: BorderRadius.circular(
                                Sizes.RADIUS_8,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppStrings.LOG_IN_4,
                                style: context.bodySmall.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: Sizes.HEIGHT_28,
                          width: Sizes.WIDTH_150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              Sizes.RADIUS_8,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.REGISTER,
                              style: context.bodySmall.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_20,
                  ),
                  const RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
