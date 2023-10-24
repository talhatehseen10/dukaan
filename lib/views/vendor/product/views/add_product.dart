import 'package:dotted_border/dotted_border.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/vendor/product/controllers/add_product_controller.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends GetView<AddProductController> {
  const AddProduct({super.key});

  static const String routeName = "/add_product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          context: context, showLogo: true, automaticallyImplyLeading: false),
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
                      content: _productDetail(),
                    ),
                    Step(
                      title: const Text("Image"),
                      isActive:
                          controller.currentStep.value == 1 ? true : false,
                      content: _image(context),
                    ),
                    Step(
                      title: const Text("Complete"),
                      isActive:
                          controller.currentStep.value == 2 ? true : false,
                      content: _complete(),
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

  Widget _complete() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_10),
            child: CustomTextField(
              lableText: "Return Policy",
              borderColor: AppColors.secondaryColor,
              fillColor: Colors.white,
              minLine: 5,
              maxLines: 5,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: "Back",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: Sizes.WIDTH_10,
              ),
              Expanded(
                child: CustomElevatedButton(
                  text: "Continue",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
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
        ),
        SizedBox(
          height: Get.height * 0.55,
          width: double.infinity,
          child: GridView.builder(
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 2.2,
                  crossAxisCount: 3,
                  mainAxisSpacing: Sizes.PADDING_16,
                  crossAxisSpacing: Sizes.PADDING_16),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: Sizes.HEIGHT_150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Sizes.HEIGHT_100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Sizes.PADDING_4,
                          top: Sizes.PADDING_6,
                        ),
                        child: Text(
                          "150 ml",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _productDetail() {
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
