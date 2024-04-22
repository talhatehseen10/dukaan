import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/product/models/product_details.dart';
import 'package:dukaan/views/seller/product/models/product_variant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool bagLoading = false.obs;
  ProductDetails? productDetails;
  ProductVariant? productVariant;
  RxString varId = "".obs;
  String? localPath;
  String? platform;

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

  Future<void> getProductDetail() async {
    await BaseClient.safeApiCall(
      ApiConstants.PRODUCT_DETAIL,
      RequestType.get,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {
        "product_id": Get.arguments[0],
      },
      onSuccess: (response) {
        addProductDetail(response.data);
      },
      onLoading: () {
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  addProductDetail(response) {
    productDetails = ProductDetails.fromJson(response);
    productVariant = productDetails!.data!.productVariant![0];
    isLoading.value = false;
  }

  addProductVariant(ProductVariant productVariant) {
    isLoading.value = true;
    this.productVariant = productVariant;
    varId.value = this.productVariant!.id.toString();
    isLoading.value = false;
  }

  Future<void> addToBag() async {
    await BaseClient.safeApiCall(
      ApiConstants.ADD_TO_BAG,
      RequestType.post,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {
        "product_id": Get.arguments[0],
      },
      data: {"variant_id": varId.value, "quantity": "1"},
      onSuccess: (response) {
        bagLoading.value = false;
        if (response.data["success"]) {
          Get.toNamed(AppRoutes.MY_BAG);
        }
      },
      onLoading: () {
        bagLoading.value = true;
      },
      onError: (e) {
        bagLoading.value = false;
      },
    );
  }

  Future<bool> checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  saveNetworkImage() async {
    var response = await Dio().get(
        AppAssets.getNetworkImage(productVariant!.image!),
        options: Options(responseType: ResponseType.bytes));
    Uint8List imageInUnit8List = response.data; // store unit8List image here ;
    final tempDir = await getTemporaryDirectory();
    File file = await File(
            '${tempDir.path}/${productDetails!.data!.pDescription}.${productVariant!.image!.split(".")[1]}')
        .create();
    file.writeAsBytesSync(imageInUnit8List);

    // FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'pdf'],
    // );
    print(file.path);
    await Share.shareXFiles([XFile(file.path)],
        text: productDetails!.data!.pDescription);

    // if (result2 == ShareResultStatus.success) {
    //   print('Thank you for sharing the picture!');
    // }
  }
}
