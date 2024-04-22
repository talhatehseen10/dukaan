import 'dart:async';

import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/address/models/customer_address.dart';
import 'package:dukaan/views/seller/address/models/customer_address_data.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_item_data.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomerAddressController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool orderRefresh = true.obs;
  RxBool addressCreationRefresh = false.obs;
  RxInt screenNo = 1.obs;
  CustomerAddress? customerAddress;
  CustomerAddressData? selectedCustomerAddress;

  late TextEditingController customerName;
  late TextEditingController phoneNo1;
  late TextEditingController phoneNo2;
  late TextEditingController sector;
  late TextEditingController apartment;
  late TextEditingController street;
  late TextEditingController nearestLandmark;

  // late TextEditingController province;
  // late TextEditingController city;
  String? province;
  String? city;
  GlobalKey<FormState> formKey = GlobalKey();

  RxString totalPrice = "0".obs;
  BagItems? bagItems;

  @override
  void onInit() {
    customerName = TextEditingController();
    phoneNo1 = TextEditingController();
    phoneNo2 = TextEditingController();
    sector = TextEditingController();
    street = TextEditingController();
    apartment = TextEditingController();
    nearestLandmark = TextEditingController();
    // province = TextEditingController();
    // city = TextEditingController();

    getCustomerAddresses();
    super.onInit();
  }

  @override
  void dispose() {
    customerName.dispose();
    phoneNo1.dispose();
    phoneNo2.dispose();
    sector.dispose();
    street.dispose();
    apartment.dispose();
    nearestLandmark.dispose();
    // province.dispose();
    // city.dispose();

    super.dispose();
  }

  Future<void> getCustomerAddresses() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_CUSTOMER_ADDRESS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addCustomerAddress(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  addCustomerAddress(response) {
    customerAddress = CustomerAddress.fromJson(response);
    isLoading.value = false;
  }

  Future<void> createCustomerAddresses() async {
    await BaseClient.safeApiCall(
      ApiConstants.CUSTOMER,
      RequestType.post,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      data: {
        "name": customerName.text,
        "phone": phoneNo1.text,
        "phone2": phoneNo2.text,
        "province_id": 4,
        "city_id": 7,
        "area": sector.text,
        "house": apartment.text,
        "street": street.text,
        "address_type": "home",
        "nearby_landmark": nearestLandmark.text
      },
      onSuccess: (response) {
        addressCreationRefresh.value = false;
        Get.snackbar("Success", "Address Added Successfully");
        getCustomerAddresses();
      },
      onLoading: () {
        addressCreationRefresh.value = true;
      },
      onError: (e) {
        Get.snackbar("Error", e.response!.data["msg"]);
        addressCreationRefresh.value = false;
      },
    );
  }

  Future<void> getItems() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_BAG_ITEMS,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addItems(response.data);
      },
      onLoading: () {
        orderRefresh.value = true;
      },
      onError: (e) {
        orderRefresh.value = false;
      },
    );
  }

  addItems(response) {
    bagItems = BagItems.fromJson(response);
    calculateTotal();
    orderRefresh.value = false;
  }

  void calculateTotal() {
    double price = 0;
    for (BagItemData bagItemData in bagItems!.data!) {
      price = price + double.parse(bagItemData.variantPrice!);
    }
    totalPrice.value = price.toString();
  }

  Future<void> createOrder() async {
    await BaseClient.safeApiCall(
      ApiConstants.CREATE_ORDER,
      RequestType.post,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      data: {"address_id": selectedCustomerAddress!.addressId},
      onSuccess: (response) {
        Get.snackbar("Success", response.data["msg"]);
        Timer(const Duration(seconds: 2), () {
          Get.offAndToNamed(AppRoutes.ORDERS);
        });
      },
      onLoading: () {},
      onError: (e) {
        Get.snackbar("Error", e.response!.data["msg"]);
      },
    );
  }
}
