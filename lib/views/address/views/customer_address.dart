import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/address/controllers/customer_address_controller.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_dropdown_button.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerAddress extends GetView<CustomerAddressController> {
  const CustomerAddress({super.key});

  static const String routeName = "/customer_address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(
          title: "Customer Address",
          context: context,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Sizes.PADDING_10),
              child: Text(
                "1 of 2",
                style: context.bodyLarge.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
            child: Column(
              children: [
                SizedBox(
                  height: Sizes.HEIGHT_30,
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      labelColor: Colors.black,
                      labelStyle: context.bodyLarge,
                      indicatorColor: const Color(0xffE28631),
                      onTap: (index) {
                        controller.selectedIndex.value = index;
                      },
                      tabs: const [
                        Tab(
                          text: "New",
                        ),
                        Tab(
                          text: "Old",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_20,
                ),
                Obx(
                  () => controller.selectedIndex.value == 0
                      ? newAddress(context)
                      : old(context),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffFFF5EC),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_28,
              vertical: Sizes.PADDING_24,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => controller.selectedIndex.value == 0
                      ? CustomElevatedButton(
                          text: "Save Address",
                          onPressed: () {},
                        )
                      : CustomElevatedButton(
                          text: "Next",
                          onPressed: () {},
                        )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget newAddress(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Customer Name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Phone No 1",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Phone No 2 (Optional)",
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
            child: CustomDropDownButton(
              isListOfString: true,
              hintText: "Province",
              fillColor: const Color(0xffFFF5EC),
              items: const ["Sindh", "Punjab"],
              onChanged: (val) {},
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
            child: CustomDropDownButton(
              isListOfString: true,
              hintText: "City",
              fillColor: const Color(0xffFFF5EC),
              items: const ["Karachi", "Hyderabad"],
              onChanged: (val) {},
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Customer Name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Sector / Block / Area Name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "House / Apartment No",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Street / Road Name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Nearest Landmark",
          ),
        ),
      ],
    );
  }

  Widget old(BuildContext context) {
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
        SizedBox(
          height: Get.height * 0.61,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.CHECK_OUT);
                },
                child: Container(
                  padding: const EdgeInsets.all(Sizes.PADDING_14),
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
                              "Ali Hyder",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Area: Gulstan Sajjad banglow no c123 house number: near faroque mosque street no: main road hyderabad jagah: near graveyard Phone Number: 03001234567",
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
        ),
      ],
    );
  }
}
