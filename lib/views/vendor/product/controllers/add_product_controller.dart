import 'dart:io';
import 'package:dio/dio.dart' as dio2;
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/vendor/product/controllers/product_controller.dart';
import 'package:dukaan/views/vendor/product/models/add_products_models/drop_down_values.dart';
import 'package:dukaan/views/vendor/product/models/add_products_models/measure_unit_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../preferences/preferences.dart';
import "package:path/path.dart" as p;

class AddProductController extends GetxController {
  RxInt currentStep = 0.obs;
  RxBool isLoading = false.obs;
  RxBool dropDownRefresh = true.obs;
  RxBool isServerError = false.obs;
  RxBool imageSelected = false.obs;
  RxBool variantImageSelected = false.obs;
  RxBool showVariantList = true.obs;
  late TextEditingController productName;
  late TextEditingController description;
  late TextEditingController stock;
  late TextEditingController marginForSeller;
  late TextEditingController inputSize;
  DropDownValues? dropDownValues;
  File? imgFile;
  String? category;
  String? measurementUnit;
  String? productId;
  late ProductController productController;

  MeasureUnitProduct? measureUnitProduct;
  File? variantImg;
  late TextEditingController varName;
  late TextEditingController varPrice;
  late TextEditingController varQtyTotal;
  late TextEditingController varQtyAvail;
  late TextEditingController varSellerMargin;
  String? measurementValue;

  @override
  void onInit() {
    productName = TextEditingController();
    description = TextEditingController();
    stock = TextEditingController();
    marginForSeller = TextEditingController();
    inputSize = TextEditingController();
    getCatUnit();
    productController = Get.find<ProductController>();

    varName = TextEditingController();
    varPrice = TextEditingController();
    varQtyTotal = TextEditingController();
    varQtyAvail = TextEditingController();
    varSellerMargin = TextEditingController();

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

  Future<void> addProduct(dio2.FormData data) async {
    await BaseClient.safeApiCall(
      ApiConstants.ADD_PRODUCT,
      RequestType.post,
      headers: await BaseClient.generateHeadersForFileWithToken(
          token: Preferences().getToken()),
      data: data,
      onSuccess: (response) {
        if (response.data["success"]) {
          Get.snackbar("Success", response.data["msg"]);
          currentStep.value = 1;
          productId = response.data["data"]["id"].toString();
          getMeasureUnit(response.data["data"]["id"].toString());
          productController.getProduct();
        } else {
          Get.snackbar("Warning", response.data["msg"]);
        }
        isLoading.value = false;
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  Future<void> getCatUnit() async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_CAT_UNIT,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      onSuccess: (response) {
        addDropDownValues(response.data);
      },
      onLoading: () {
        dropDownRefresh.value = true;
      },
      onError: (e) {
        isServerError.value = true;
        dropDownRefresh.value = false;
      },
    );
  }

  Future<void> getMeasureUnit(String productId) async {
    await BaseClient.safeApiCall(
      ApiConstants.GET_MEASURE_UNIT,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {"product_id": productId},
      onSuccess: (response) {
        addMeasureProduct(response.data);
      },
      onLoading: () {
        dropDownRefresh.value = true;
      },
      onError: (e) {
        isServerError.value = true;
        dropDownRefresh.value = false;
      },
    );
  }

  void createProduct() async {
    dio2.FormData formData = dio2.FormData.fromMap({
      "product_img": await dio2.MultipartFile.fromFile(imgFile!.path,
          filename: p.basename(imgFile!.path)),
      "p_category_id": category,
      "p_name": productName.text,
      "p_description": description.text,
      "p_unit_id": measurementUnit
    });
    addProduct(formData);
  }

  void addDropDownValues(response) {
    isServerError.value = false;
    dropDownValues = DropDownValues.fromJson(response);

    dropDownRefresh.value = false;
  }

  void addMeasureProduct(response) {
    isServerError.value = false;
    measureUnitProduct = MeasureUnitProduct.fromJson(response);

    dropDownRefresh.value = false;
  }

  void pickImage({bool isProductImg = true}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (img == null) return;
    if (isProductImg) {
      imgFile = File(img.path);
      imageSelected.value = true;
    } else {
      variantImg = File(img.path);
      variantImageSelected.value = true;
    }
  }

  Future<void> createProductVariant(dio2.FormData data) async {
    await BaseClient.safeApiCall(
      ApiConstants.CREATE_PRODUCT_VARIANT,
      RequestType.post,
      headers: await BaseClient.generateHeadersForFileWithToken(
          token: Preferences().getToken()),
      data: data,
      onSuccess: (response) {
        if (response.data["success"]) {
          Get.snackbar("Success", response.data["msg"]);
          showVariantList.value = true;
        } else {
          Get.snackbar("Warning", response.data["msg"]);
        }
        isLoading.value = false;
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  void createVariant() async {
    dio2.FormData formData = dio2.FormData.fromMap({
      "var_img": await dio2.MultipartFile.fromFile(variantImg!.path,
          filename: p.basename(variantImg!.path)),
      "var_product_id": productId,
      "var_name": varName.text,
      "var_price": varPrice.text,
      "var_quantity_total": varQtyTotal.text,
      "var_quantity_available": varQtyAvail.text,
      "var_measurement_unit": measurementUnit,
      "var_measurement_value": measurementValue,
      "var_seller_margin": varSellerMargin.text
    });
    createProductVariant(formData);
  }
}
