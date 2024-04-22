import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/address/components/new_address.dart';
import 'package:dukaan/views/seller/address/components/old.dart';
import 'package:dukaan/views/seller/address/controllers/customer_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget first(BuildContext context, CustomerAddressController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          SizedBox(
            height: Sizes.HEIGHT_30,
            child: DefaultTabController(
              length: 2,
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: context.bodyLarge,
                indicatorColor: const Color(0xffE28631),
                onTap: (index) {
                  controller.selectedIndex.value = index;
                },
                tabs: const [
                  Tab(
                    text: "New",
                  ),
                  Tab(
                    text: "Old",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_20,
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.primaryColor,
                    ),
                  )
                : controller.selectedIndex.value == 0
                    ? newAddress(context, controller)
                    : old(context, controller),
          ),
        ],
      ),
    ],
  );
}
