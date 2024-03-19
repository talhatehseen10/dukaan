import 'package:dotted_border/dotted_border.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/views/vendor/product/controllers/add_product_controller.dart';
import 'package:dukaan/views/vendor/product/models/add_products_models/product_variant_element.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_dropdown_button.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget variant(BuildContext context, AddProductController controller) {
  return Column(
    children: [
      Obx(() => controller.showVariantList.value
          ? controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.productVariant == null
                  ? const SizedBox()
                  : SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller
                            .productVariant!.data!.productVariants!.length,
                        itemBuilder: (context, index) {
                          ProductVariantElement data = controller
                              .productVariant!.data!.productVariants![index];
                          return Container(
                            height: Sizes.HEIGHT_90,
                            width: Get.width * 1,
                            margin: const EdgeInsets.symmetric(
                                vertical: Sizes.MARGIN_6),
                            padding: const EdgeInsets.all(Sizes.PADDING_8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.circular(Sizes.RADIUS_6),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Sizes.HEIGHT_74,
                                  width: Sizes.WIDTH_74,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.RADIUS_8),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          ApiConstants.BASE_URL_IMAGE +
                                              data.imageUrl!),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: Sizes.WIDTH_12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data.varName!,
                                        style: context.bodySmall,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Rs ${data.varPrice}",
                                        style: context.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: Sizes.WIDTH_12,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.delete_outline,
                                      color: AppColors.secondaryColor,
                                    ),
                                    Text(
                                      "${data.varMeasurementValue} ${data.varMeasurementUnit}",
                                      style: context.bodyMedium.copyWith(
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
          : SizedBox(
              child: Column(
                children: [
                  CustomTextField(
                    lableText: "Name",
                    controller: controller.varName,
                    fillColor: Colors.white,
                    borderColor: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_10,
                  ),
                  CustomTextField(
                    controller: controller.varPrice,
                    lableText: "Price",
                    fillColor: Colors.white,
                    keyboaredtype: TextInputType.number,
                    borderColor: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_10,
                  ),
                  CustomTextField(
                    lableText: "Available Quantity",
                    controller: controller.varQtyAvail,
                    keyboaredtype: TextInputType.number,
                    fillColor: Colors.white,
                    borderColor: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_10,
                  ),
                  CustomTextField(
                    controller: controller.varQtyTotal,
                    keyboaredtype: TextInputType.number,
                    lableText: "Total Quantity",
                    fillColor: Colors.white,
                    borderColor: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_10,
                  ),
                  Obx(
                    () => controller.dropDownRefresh.value
                        ? const SizedBox()
                        : controller.isServerError.value
                            ? const SizedBox()
                            : CustomDropDownButton(
                                hintText: "Measurements",
                                borderColor: AppColors.secondaryColor,
                                isListOfString: false,
                                dropDownItemList: controller.measureUnitProduct!
                                    .data!.measurementValues!
                                    .map((e) => DropdownMenuItem(
                                          value: e.id,
                                          child: Text(
                                            e.value!,
                                            style: context.bodySmall,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  controller.measurementValue = val.toString();
                                },
                              ),
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_10,
                  ),
                  CustomTextField(
                    controller: controller.varSellerMargin,
                    keyboaredtype: TextInputType.number,
                    lableText: "Seller Margin",
                    fillColor: Colors.white,
                    borderColor: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    height: Sizes.HEIGHT_10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.PADDING_16,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.pickImage(isProductImg: false);
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
                  Obx(
                    () => controller.variantImageSelected.value
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
                          ),
                  ),
                ],
              ),
            )),
      const SizedBox(
        height: Sizes.HEIGHT_10,
      ),
      Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              text: "Add Variant",
              onPressed: () {
                if (controller.showVariantList.value) {
                  controller.showVariantList.value =
                      !controller.showVariantList.value;
                } else {
                  controller.createVariant();
                }
              },
            ),
          ),
        ],
      ),
    ],
  );
}
