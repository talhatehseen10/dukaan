import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/vendor/orders/controllers/orders_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends GetView<OrdersController> {
  const Orders({super.key});

  static const String routeName = "/orders_vendor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          context: context, showLogo: true, automaticallyImplyLeading: false),
      body: Column(
        children: [
          SizedBox(
            height: Sizes.HEIGHT_30,
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: context.bodyLarge,
                indicatorColor: const Color(0xffE28631),
                onTap: (index) {
                  controller.selectedIndex.value = index;
                },
                tabs: const [
                  Tab(
                    text: "Delivered",
                  ),
                  Tab(
                    text: "Pending",
                  ),
                  Tab(
                    text: "Returned",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_10,
          ),
          Expanded(
            child: tab(context),
          ),
        ],
      ),
    );
  }
}

Widget tab(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: Sizes.PADDING_10,
      horizontal: Sizes.PADDING_24,
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_10),
          child: Row(
            children: [
              Text(
                "12-01-2023",
                style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff6C6C6C),
                    fontSize: Sizes.TEXT_SIZE_14),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  bottom: Sizes.PADDING_10,
                ),
                padding: const EdgeInsets.all(Sizes.PADDING_10),
                width: double.infinity,
                height: Sizes.HEIGHT_150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                  color: const Color(0xffF9F9F9),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: Sizes.HEIGHT_140,
                        width: Sizes.WIDTH_140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image2.png"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Sizes.WIDTH_10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivered To: Aqsa Jamali",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_6,
                          ),
                          Text(
                            "Order No. 1321123",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_6,
                          ),
                          Text(
                            "Rs: 1340",
                            style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryColor),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: Sizes.HEIGHT_36,
                                width: Sizes.WIDTH_120,
                                child: CustomElevatedButton(
                                  text: "View",
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
