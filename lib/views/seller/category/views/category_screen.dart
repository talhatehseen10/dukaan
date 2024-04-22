import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/category/components/category_button.dart';
import 'package:dukaan/views/seller/category/controllers/category_controller.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  static const String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          title: "Category",
          context: context,
          automaticallyImplyLeading: false),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
          child: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.primaryColor,
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.category!.data!.length,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: Sizes.PADDING_10,
                    ),
                    itemBuilder: (context, index) {
                      return categoryButton(
                          context, controller.category!.data![index]);
                    },
                  ),
          )),
    );
  }
}
