import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/vendor/product/controllers/product_controller.dart';
import 'package:dukaan/views/vendor/product/models/data.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends GetView<ProductController> {
  const Product({super.key});

  static const String routeName = "/product_vendor";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => controller.isBottomContainerVisible.value
          ? _bottomContainer(context, controller)
          : const CustomNavigatorBar()),
      floatingActionButton:
          Obx(() => controller.isBottomContainerVisible.value == false
              ? FloatingActionButton(
                  backgroundColor: context.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Sizes.RADIUS_30,
                    ),
                  ),
                  onPressed: () {
                    controller.isBottomContainerVisible.value =
                        !controller.isBottomContainerVisible.value;
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : const SizedBox()),
      appBar: customAppBar(
          context: context, showLogo: true, automaticallyImplyLeading: false),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: context.primaryColor,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.PADDING_2,
                    horizontal: Sizes.PADDING_24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Beauty Products",
                        style: context.bodySmall.copyWith(
                            fontSize: Sizes.TEXT_SIZE_14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Text(
                        "See All",
                        style: context.bodySmall.copyWith(
                            fontSize: Sizes.TEXT_SIZE_14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondaryColor),
                      ),
                    ],
                  ),
                ),
                tab(context, controller),
              ],
            )),
    );
  }
}

Widget _bottomContainer(BuildContext context, ProductController controller) {
  return Container(
    height: Sizes.HEIGHT_200,
    color: const Color(0xffFFF5EC),
    padding: const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_28,
      vertical: Sizes.PADDING_24,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                controller.isBottomContainerVisible.value = false;
              },
              child: const Icon(
                Icons.cancel,
                size: Sizes.ICON_SIZE_24,
              ),
            )
          ],
        ),
        SizedBox(
          height: Sizes.HEIGHT_50,
          width: double.infinity,
          child: CustomElevatedButton(
            text: "Add Product",
            onPressed: () {
              controller.isBottomContainerVisible.value = false;
              Get.toNamed(AppRoutes.ADD_PRODUCT_VENDOR);
            },
          ),
        ),
        SizedBox(
          height: Sizes.HEIGHT_50,
          width: double.infinity,
          child: CustomElevatedButton(
            text: "Add Category",
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

Widget tab(BuildContext context, ProductController controller) {
  return Expanded(
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.PADDING_10,
        horizontal: Sizes.PADDING_24,
      ),
      itemCount: controller.products!.data!.length,
      itemBuilder: (context, index) {
        Data _product = controller.products!.data![index];

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
                    Row(
                      children: [
                        Text(
                          "Product Code: ",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _product.pCode!,
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Sizes.HEIGHT_6,
                    ),
                    Text(
                      "Category. ${_product.category!.pcName}",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: Sizes.HEIGHT_6,
                    ),
                    Text(
                      "Rs: ${_product.pPrice}",
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
  );
}
