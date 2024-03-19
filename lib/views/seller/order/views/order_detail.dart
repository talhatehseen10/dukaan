import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:dukaan/widgets/custom_widgets/custom_textbox_with_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  static const String routeName = "/order_detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFCFA),
      appBar: customAppBar(
          context: context,
          title: "Order Detail",
          automaticallyImplyLeading: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.PADDING_30, horizontal: Sizes.PADDING_30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Size: 150 ml",
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                SizedBox(
                  height: Sizes.HEIGHT_30,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Sizes.HEIGHT_30,
                          width: Sizes.WIDTH_80,
                          margin: index != 0
                              ? const EdgeInsets.only(left: Sizes.PADDING_10)
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFE9E9),
                            borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                          ),
                          child: Center(
                            child: Text(
                              "150 ml",
                              style: context.bodySmall
                                  .copyWith(color: context.primaryColor),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity:",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: Sizes.WIDTH_88,
                      height: Sizes.HEIGHT_36,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: context.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(Sizes.RADIUS_6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.do_disturb_on,
                            size: Sizes.ICON_SIZE_24,
                          ),
                          Text(
                            "1",
                            style: context.bodySmall.copyWith(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.add_circle,
                            size: Sizes.ICON_SIZE_24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_30,
                ),
                const CustomTextBoxWithTitle(
                  title: "Your Profit",
                  fieldWidth: double.infinity,
                  fieldValue: "PKR",
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Whole Sale Price",
                        style: context.bodySmall
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Rs. 1230",
                        style: context.bodySmall
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Profit",
                        style: context.bodySmall
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Rs. 0",
                        style: context.bodySmall
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Sizes.WIDTH_130,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.local_shipping,
                              color: AppColors.secondaryColor,
                              size: Sizes.ICON_SIZE_24,
                            ),
                            const SizedBox(
                              width: Sizes.WIDTH_10,
                            ),
                            Text(
                              "Delivery",
                              style: context.bodySmall.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Rs. 100",
                        style: context.bodySmall.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_50,
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffFFF5EC),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_28,
              vertical: Sizes.PADDING_24,
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    "Customer Price",
                    style: context.bodyLarge.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  trailing: Text(
                    "Rs. 1340",
                    style: context.bodySmall.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: Sizes.TEXT_SIZE_20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_20,
                ),
                const Divider(
                  thickness: 0.5,
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Add to Bag",
                        onPressed: () {
                          Get.toNamed(AppRoutes.MY_BAG);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: Sizes.WIDTH_20,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Share",
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
  }
}
