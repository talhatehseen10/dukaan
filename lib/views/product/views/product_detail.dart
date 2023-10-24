import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/product/components/product_description.dart';
import 'package:dukaan/views/product/components/product_name_size.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_widgets/custom_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  static const String routeName = "/product_detials";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomContainer(context),
      appBar: customAppBar(
          context: context,
          title: "Product Detail",
          automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productNameSize(context),
            const SizedBox(
              height: Sizes.HEIGHT_50,
            ),
            productDetail(context),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
            Container(
              height: Sizes.HEIGHT_200,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(Sizes.PADDING_20),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: Sizes.HEIGHT_54,
                      width: Sizes.WIDTH_54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.primaryColor),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/cart.png'),
                        ),
                      ),
                    ),
                    title: Text(
                      "Sam’s Store",
                      style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Visit Shop",
                          style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryColor),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: Sizes.ICON_SIZE_20,
                          color: AppColors.secondaryColor,
                        )
                      ],
                    ),
                    trailing: SizedBox(
                      width: Sizes.WIDTH_80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.CHAT,
                            style: context.bodyLarge,
                          ),
                          const Icon(
                            Icons.message_outlined,
                            color: AppColors.secondaryColor,
                            size: Sizes.ICON_SIZE_20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.PADDING_20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: Sizes.ICON_SIZE_24,
                                    color: AppColors.secondaryColor,
                                  ),
                                  const SizedBox(
                                    width: Sizes.WIDTH_2,
                                  ),
                                  Text(
                                    "5.0",
                                    style: context.bodySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Sizes.HEIGHT_10,
                              ),
                              Text(
                                "Rating",
                                style: context.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "123",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: Sizes.HEIGHT_10,
                              ),
                              Text(
                                "Followers",
                                style: context.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2124",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: Sizes.HEIGHT_10,
                              ),
                              Text(
                                "Product",
                                style: context.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomContainer(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_210,
      color: const Color(0xffFFF5EC),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_28,
        vertical: Sizes.PADDING_24,
      ),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              "Rs. 1230",
              style: context.bodyLarge
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            trailing: SizedBox(
              width: Sizes.WIDTH_130,
              child: Row(
                children: [
                  const Icon(
                    Icons.local_shipping,
                    color: AppColors.secondaryColor,
                    size: Sizes.ICON_SIZE_24,
                  ),
                  const SizedBox(
                    width: Sizes.WIDTH_4,
                  ),
                  Text(
                    "Delivery Rs. 100",
                    style: context.bodySmall.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
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
                  text: "Place Order",
                  onPressed: () {
                    Get.toNamed(AppRoutes.ORDER_DETAILS);
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
    );
  }
}
