import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/address/components/bottom_container.dart';
import 'package:dukaan/views/seller/address/components/first.dart';
import 'package:dukaan/views/seller/address/components/second.dart';
import 'package:dukaan/views/seller/address/controllers/customer_address_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerAddress extends GetView<CustomerAddressController> {
  const CustomerAddress({super.key});

  static const String routeName = "/customer_address";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomContainer(context, controller),
      appBar: customAppBar(
        title: "Customer Address",
        context: context,
        actions: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: Sizes.PADDING_20),
              child: Text(
                "${controller.screenNo.value} of 2",
                style: context.bodyLarge.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        widget: GestureDetector(
          onTap: () {
            if (controller.screenNo.value == 2) {
              controller.screenNo.value = 1;
            } else {
              Get.back();
            }
          },
          child: Icon(
            Icons.arrow_back,
            color: context.iconColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: Sizes.PADDING_20,
            right: Sizes.PADDING_20,
            top: Sizes.PADDING_20),
        child: SingleChildScrollView(
          child: Obx(() => controller.screenNo.value == 1
              ? first(context, controller)
              : second(context, controller)),
        ),
      ),
    );
  }
}
