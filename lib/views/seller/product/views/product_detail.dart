import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/views/seller/product/components/bottom_container.dart';
import 'package:dukaan/views/seller/product/components/product_description.dart';
import 'package:dukaan/views/seller/product/components/product_name_size.dart';
import 'package:dukaan/views/seller/product/components/vendor_details.dart';
import 'package:dukaan/views/seller/product/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_widgets/custom_app_bar.dart';

class ProductDetails extends GetView<ProductDetailsController> {
  const ProductDetails({super.key});

  static const String routeName = "/product_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => controller.isLoading.value
          ? const SizedBox()
          : bottomContainer(context, controller)),
      appBar: customAppBar(
          context: context,
          title: "Product Detail",
          automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productNameSize(context, controller),
            const SizedBox(
              height: Sizes.HEIGHT_50,
            ),
            productDetail(context, controller),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
            vendorDetails(context, controller),
            const SizedBox(
              height: Sizes.HEIGHT_22,
            ),
          ],
        ),
      ),
    );
  }
}
