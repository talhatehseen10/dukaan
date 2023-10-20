import 'package:dotted_border/dotted_border.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/vendor/product/controllers/product_controller.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends GetView<ProductController> {
  const Product({super.key});

  static const String routeName = "/product_vendor";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          context: context,
          title: AppStrings.APP_NAME,
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Theme(
                data: ThemeData(
                  canvasColor: Colors.grey.shade100,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: AppColors.secondaryColor,
                        // background: Colors.red,
                        // secondary: Colors.green,
                      ),
                ),
                child: Stepper(
                  onStepTapped: (index) {
                    controller.currentStep.value = index;
                  },
                  controlsBuilder: (context, controller) {
                    return const SizedBox();
                  },
                  currentStep: controller.currentStep.value,
                  type: StepperType.horizontal,
                  steps: [
                    Step(
                      title: const Text("Product Details"),
                      isActive:
                          controller.currentStep.value == 0 ? true : false,
                      content: productDetail(),
                    ),
                    Step(
                      title: const Text("Image"),
                      isActive:
                          controller.currentStep.value == 1 ? true : false,
                      content: image(context),
                    ),
                    Step(
                      title: const Text("Complete"),
                      isActive:
                          controller.currentStep.value == 2 ? true : false,
                      content: const Center(
                        child: Text("Completed"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          lableText: "Input Size",
          fillColor: Colors.white,
          borderColor: AppColors.secondaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.PADDING_16,
          ),
          child: DottedBorder(
            color: const Color(0xffD9D9D9),
            strokeWidth: 1,
            borderType: BorderType.RRect,
            dashPattern: const [8],
            padding: const EdgeInsets.all(Sizes.PADDING_8),
            radius: const Radius.circular(Sizes.RADIUS_10),
            child: SizedBox(
              height: Sizes.HEIGHT_46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    color: Color(0xffA7A7A7),
                    size: Sizes.ICON_SIZE_24,
                  ),
                  const SizedBox(
                    width: Sizes.WIDTH_6,
                  ),
                  Text(
                    "Add Image",
                    style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget productDetail() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            lableText: "Product Name",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            lableText: "Description",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
            minLine: 5,
            maxLines: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            lableText: "Stock",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            lableText: "Category",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            lableText: "Measurement",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            lableText: "Margin for Seller",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
