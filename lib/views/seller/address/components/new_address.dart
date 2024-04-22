import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/views/seller/address/controllers/customer_address_controller.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';

Widget newAddress(BuildContext context, CustomerAddressController controller) {
  return Form(
    key: controller.formKey,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.customerName,
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Customer Name",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.phoneNo1,
            keyboaredtype: TextInputType.number,
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Phone No 1",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.phoneNo2,
            keyboaredtype: TextInputType.number,
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
              items: const ["Sindh"],
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required";
                }
                return null;
              },
              onChanged: (val) {
                controller.province = val;
              },
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
            child: CustomDropDownButton(
              isListOfString: true,
              hintText: "City",
              fillColor: const Color(0xffFFF5EC),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required";
                }
                return null;
              },
              items: const ["Karachi"],
              onChanged: (val) {
                controller.city = val;
              },
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.sector,
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Sector / Block / Area Name",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.apartment,
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "House / Apartment No",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.street,
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Street / Road Name",
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Required";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Sizes.PADDING_12),
          child: CustomTextField(
            controller: controller.nearestLandmark,
            borderColor: Colors.white,
            fillColor: const Color(0xffFFF5EC),
            lableText: "Nearest Landmark",
          ),
        ),
      ],
    ),
  );
}
