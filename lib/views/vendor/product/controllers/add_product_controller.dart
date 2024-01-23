import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  RxInt currentStep = 0.obs;
  RxBool isLoading = false.obs;

  late TextEditingController productName;
  late TextEditingController description;
  late TextEditingController stock;
  late TextEditingController marginForSeller;
  late TextEditingController inputSize;

  @override
  void onInit() {
    productName = TextEditingController();
    description = TextEditingController();
    stock = TextEditingController();
    marginForSeller = TextEditingController();
    inputSize = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    productName.dispose();
    description.dispose();
    stock.dispose();
    marginForSeller.dispose();
    inputSize.dispose();
    super.dispose();
  }

  Future<void> addProduct() async {
    await BaseClient.safeApiCall(
      ApiConstants.ADD_PRODUCT,
      RequestType.post,
      headers: await BaseClient.generateHeaders(),
      data: {
        "p_code": "ABC123x",
        "p_name": productName.text,
        "p_delivery_time": "2-3 days",
        "p_measure_unit": "pcs",
        "p_measure_value": 10,
        "p_description": description.text,
        "p_return_policy": "30-day return policy",
        "p_price": 49.99,
        "p_discount": 10.0,
        "p_delivery_fee": 5.0,
        "p_quantity_total": 100,
        "p_quantity_available": 100,
        "p_vendor_id": 1, // Vendor ID (adjust as needed)
        "p_category_id": 2, // Category ID (adjust as needed)
        "measurements": [
          {
            "p_measure_value": 100,
            "p_measure_unit": "pcs",
            "pm_quantity_total": 100,
            "pm_quantity_available": 45
          },
          {
            "p_measure_value": 5.50,
            "p_measure_unit": "kg",
            "pm_quantity_total": 1000,
            "pm_quantity_available": 151
          }
        ],
        "images": [
          {
            "img_url": "https://example.com/image1x.jpg",
            "img_name": "Image 1",
            "img_desc": "Description for Image 1"
          },
          {
            "img_url": "https://example.com/image2x.jpg",
            "img_name": "Image 2",
            "img_desc": "Description for Image 2"
          }
        ]
      },
      onSuccess: (response) {},
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }
}
