import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_item_data.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_items.dart';
import 'package:get/get.dart';

class MyBagController extends GetxController {
  RxBool isLoading = true.obs;
  RxString totalPrice = "0".obs;
  BagItems? bagItems;

  @override
  void onInit() {
    getItems();
    super.onInit();
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
        isLoading.value = true;
      },
      onError: (e) {
        isLoading.value = false;
      },
    );
  }

  addItems(response) {
    bagItems = BagItems.fromJson(response);
    calculateTotal();
    isLoading.value = false;
  }

  void calculateTotal() {
    double price = 0;
    for (BagItemData bagItemData in bagItems!.data!) {
      double calPrice =
          double.parse(bagItemData.variantPrice!) * bagItemData.quantity!;
      print("PRICE: $calPrice");
      price = price + double.parse(calPrice.toString());
    }
    totalPrice.value = price.toString();
  }

  Future<void> updateItemQty(int bagItemId, int qty) async {
    await BaseClient.safeApiCall(
      ApiConstants.UPDATE_BAG_ITEM_QTY,
      RequestType.post,
      headers: await BaseClient.generateHeadersWithToken(
          token: Preferences().getToken()),
      queryParameters: {
        "bag_item_id": bagItemId,
        "quantity": qty,
      },
      onSuccess: (response) {},
      onLoading: () {},
      onError: (e) {},
    );
  }

  updateItemsQty(response) {
    bagItems = BagItems.fromJson(response);
    calculateTotal();
    isLoading.value = false;
  }
}
