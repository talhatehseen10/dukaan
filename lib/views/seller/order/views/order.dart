import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/seller/order/components/item_card.dart';
import 'package:dukaan/views/seller/order/controllers/order_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Order extends GetView<OrderController> {
  const Order({super.key});

  static const String routeName = "/order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
        title: "Orders",
        context: context,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_18),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.status.value = "In-Progress";
                          controller.getOrders();
                        },
                        child: Container(
                          height: Sizes.HEIGHT_30,
                          width: Sizes.WIDTH_110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Sizes.RADIUS_8,
                            ),
                            border: controller.status.value == "In-Progress"
                                ? Border.all(color: context.primaryColor)
                                : null,
                            color: const Color(0xffFFE9E9),
                          ),
                          child: Center(
                            child: Text(
                              "In-Progress",
                              style: context.bodySmall
                                  .copyWith(color: context.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.status.value = "Delivered";
                          controller.getOrders();
                        },
                        child: Container(
                          height: Sizes.HEIGHT_30,
                          width: Sizes.WIDTH_110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Sizes.RADIUS_8,
                            ),
                            border: controller.status.value == "Delivered"
                                ? Border.all(color: context.primaryColor)
                                : null,
                            color: const Color(0xffFFE9E9),
                          ),
                          child: Center(
                            child: Text(
                              "Delivered",
                              style: context.bodySmall
                                  .copyWith(color: context.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.status.value = "Returned";
                          controller.getOrders();
                        },
                        child: Container(
                          height: Sizes.HEIGHT_30,
                          width: Sizes.WIDTH_110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Sizes.RADIUS_8,
                            ),
                            border: controller.status.value == "Returned"
                                ? Border.all(color: context.primaryColor)
                                : null,
                            color: const Color(0xffFFE9E9),
                          ),
                          child: Center(
                            child: Text(
                              "Returned",
                              style: context.bodySmall
                                  .copyWith(color: context.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            const Divider(
              color: Color(0xff6C6C6C),
              thickness: 0.5,
            ),
            Flexible(
              child: Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: context.primaryColor,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.orders!.data!.length,
                        itemBuilder: (context, index) {
                          return itemCard(
                              context, controller.orders!.data![index]);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
