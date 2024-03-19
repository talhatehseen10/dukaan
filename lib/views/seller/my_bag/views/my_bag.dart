import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBag extends StatelessWidget {
  const MyBag({super.key});
  static const String routeName = "/my_bag";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: "My Bag", automaticallyImplyLeading: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.PADDING_24,
                        vertical: Sizes.PADDING_20),
                    decoration: const BoxDecoration(
                      color: Color(0xffF9F9F9),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    height: Sizes.HEIGHT_30,
                                    width: Sizes.WIDTH_30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: context.primaryColor,
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/cart.png"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Sizes.WIDTH_10,
                                  ),
                                  Text(
                                    "Sam’s Store",
                                    style: context.bodySmall
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Visit Shop",
                                    style: context.bodySmall.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.secondaryColor),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.secondaryColor,
                                    size: Sizes.ICON_SIZE_24,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Sizes.RADIUS_10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: Sizes.HEIGHT_110,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: Sizes.PADDING_12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.primaryColor,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft:
                                            Radius.circular(Sizes.RADIUS_10),
                                        bottomLeft:
                                            Radius.circular(Sizes.RADIUS_10)),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/image2.png"),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: Sizes.HEIGHT_110,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Sizes.PADDING_10,
                                      horizontal: Sizes.PADDING_20),
                                  decoration: const BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Sizes.RADIUS_10),
                                        bottomRight:
                                            Radius.circular(Sizes.RADIUS_10)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sploofy PRO - Per Sploofy PRO - Per...",
                                        style: context.bodySmall.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs. 1330",
                                            style: context.bodySmall.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            height: Sizes.HEIGHT_32,
                                            width: Sizes.WIDTH_32,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        context.primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Sizes.RADIUS_6)),
                                            child: const Icon(
                                              Icons.add_circle,
                                              size: Sizes.ICON_SIZE_24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Sizes.HEIGHT_10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size:",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "150 ml",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Sizes.HEIGHT_10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size:",
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor),
                            ),
                            Text(
                              "Rs 0",
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: Sizes.HEIGHT_10,
                  );
                },
                itemCount: 10),
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
                        text: "Proceed To Checkout",
                        onPressed: () {
                          Get.toNamed(AppRoutes.CUSTOMER_ADDRESS);
                        },
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
