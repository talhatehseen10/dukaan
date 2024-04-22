import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/my_bag/controllers/my_bag_controller.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_item_data.dart';
import 'package:flutter/material.dart';

Widget itemIncrement(BuildContext context, MyBagController controller,
    {required bool addItem, required BagItemData data}) {
  return addItem
      ? Container(
          height: Sizes.HEIGHT_32,
          width: Sizes.WIDTH_90,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_10),
          decoration: BoxDecoration(
              border: Border.all(color: context.primaryColor),
              borderRadius: BorderRadius.circular(Sizes.RADIUS_6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.isLoading.value = true;
                  if (data.quantity! > 1) {
                    data.quantity = data.quantity! - 1;
                    controller.calculateTotal();
                    controller.updateItemQty(data.id!, data.quantity!);
                  }
                  controller.isLoading.value = false;
                },
                child: const Icon(
                  Icons.remove_circle,
                  size: Sizes.ICON_SIZE_24,
                  color: Colors.white,
                ),
              ),
              Text(
                data.quantity.toString(),
                style: context.bodySmall
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  controller.isLoading.value = true;
                  data.quantity = data.quantity! + 1;
                  controller.calculateTotal();
                  controller.updateItemQty(data.id!, data.quantity!);
                  controller.isLoading.value = false;
                },
                child: const Icon(
                  Icons.add_circle,
                  size: Sizes.ICON_SIZE_24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      : Container(
          height: Sizes.HEIGHT_32,
          width: Sizes.WIDTH_32,
          decoration: BoxDecoration(
              border: Border.all(color: context.primaryColor),
              borderRadius: BorderRadius.circular(Sizes.RADIUS_6)),
          child: const Icon(
            Icons.add_circle,
            size: Sizes.ICON_SIZE_24,
            color: Colors.white,
          ),
        );
}
