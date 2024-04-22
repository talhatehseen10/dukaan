import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/address/controllers/customer_address_controller.dart';
import 'package:dukaan/views/seller/address/models/customer_address_data.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget old(BuildContext context, CustomerAddressController controller) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(
        height: Sizes.HEIGHT_18,
      ),
      CustomTextField(
        fillColor: const Color(0xffFFF5EC),
        borderColor: Colors.white,
        prefix: Icon(
          Icons.search,
          color: context.iconColor,
        ),
        lableText: "Find Address",
      ),
      const SizedBox(
        height: Sizes.HEIGHT_16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: Sizes.WIDTH_10,
          ),
          Text(
            "Customer Address",
            style: context.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: Sizes.HEIGHT_16,
      ),
      ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: controller.customerAddress!.data!.length,
        itemBuilder: (context, index) {
          CustomerAddressData data = controller.customerAddress!.data![index];
          return GestureDetector(
            onTap: () {
              controller.getItems();
              controller.selectedCustomerAddress = data;
              controller.screenNo.value = 2;

              //Get.toNamed(AppRoutes.CHECK_OUT);
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.PADDING_14),
              margin: const EdgeInsets.symmetric(vertical: Sizes.MARGIN_6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                color: const Color(0xffF9F9F9),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: Sizes.ICON_SIZE_24,
                  ),
                  const SizedBox(
                    width: Sizes.WIDTH_14,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name ?? "",
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Area: ${data.area}",
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "House No: ${data.house}",
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Street: ${data.street}",
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Phone No: ${data.phone}",
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}
