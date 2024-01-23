import 'package:dukaan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void loadingDialog(String? msg) {
    Get.defaultDialog(
          title: "",
          titlePadding: EdgeInsets.zero,
          radius: Sizes.RADIUS_6,
          titleStyle: const TextStyle(fontSize: Sizes.TEXT_SIZE_16),
          backgroundColor: Colors.white,
          content:  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(msg!),
                ],
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        );
}
