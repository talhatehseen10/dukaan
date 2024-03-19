import 'package:dotted_border/dotted_border.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/vendor/product/components/variant.dart';
import 'package:dukaan/views/vendor/product/controllers/add_product_controller.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_dropdown_button.dart';
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
                      content: _productDetail(context),
                    ),
                    Step(
                      title: const Text("Variant"),
                      isActive:
                          controller.currentStep.value == 1 ? true : false,
                      content: variant(context, controller),
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

  Widget _productDetail(BuildContext context) {
    return Column(
      children: [
        Obx(() => controller.imageSelected.value
            ? Container(
                height: Sizes.HEIGHT_150,
                width: Get.width * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: FileImage(controller.imgFile!),
                  ),
                ),
              )
            : const SizedBox(
                height: Sizes.HEIGHT_10,
              )),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.PADDING_16,
          ),
          child: GestureDetector(
            onTap: () {
              controller.pickImage();
            },
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
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.productName,
            lableText: "Product Name",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.description,
            lableText: "Description",
            fillColor: Colors.white,
            borderColor: AppColors.secondaryColor,
            minLine: 5,
            maxLines: 5,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
        //   child: CustomTextField(
        //     lableText: "Stock",
        //     fillColor: Colors.white,
        //     borderColor: AppColors.secondaryColor,
        //   ),
        // );
        Obx(
          () => controller.dropDownRefresh.value
              ? const SizedBox()
              : controller.isServerError.value
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
                      child: CustomDropDownButton(
                        hintText: "Category",
                        borderColor: AppColors.secondaryColor,
                        isListOfString: false,
                        dropDownItemList:
                            controller.dropDownValues!.data!.productCategories!
                                .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.pcName!),
                                    ))
                                .toList(),
                        onChanged: (val) {
                          controller.category = val.toString();
                        },
                      ),
                    ),
        ),
        Obx(
          () => controller.dropDownRefresh.value
              ? const SizedBox()
              : controller.isServerError.value
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
                      child: CustomDropDownButton(
                        hintText: "Measurement Unit",
                        borderColor: AppColors.secondaryColor,
                        isListOfString: false,
                        dropDownItemList:
                            controller.dropDownValues!.data!.units!
                                .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.unit!),
                                    ))
                                .toList(),
                        onChanged: (val) {
                          controller.measurementUnit = val.toString();
                        },
                      ),
                    ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Days",
              style: context.bodySmall.copyWith(color: AppColors.black),
            ),
            Container(
              padding: const EdgeInsets.all(Sizes.PADDING_4),
              decoration: BoxDecoration(
                  border: Border.all(color: context.primaryColor),
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.PADDING_2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor),
                      child: const Icon(
                        Icons.remove,
                        size: Sizes.ICON_SIZE_14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.PADDING_6),
                    child: Text(
                      "100",
                      style: context.bodySmall
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.PADDING_2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor),
                      child: const Icon(
                        Icons.add,
                        size: Sizes.ICON_SIZE_14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Sizes.HEIGHT_10,
        ),
        SizedBox(
          width: double.infinity,
          child: Obx(() => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomElevatedButton(
                  text: "Create Product",
                  onPressed: () {
                    controller.createProduct();
                  },
                )),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
        //   child: CustomTextField(
        //     lableText: "Margin for Seller",
        //     fillColor: Colors.white,
        //     borderColor: AppColors.secondaryColor,
        //   ),
        // ),
      ],
    );
  }
}
