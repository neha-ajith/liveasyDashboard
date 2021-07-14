import 'package:get/get.dart';

class ShipperController extends GetxController {
  RxString choosenShipperFilter = "All".obs;

  void updateOnShipperFilterValue(String newValue) {
    choosenShipperFilter.value = newValue;
  }

  RxBool onShipperDeleted = false.obs;

  void updateOnShipperDelete(bool newValue) {
    onShipperDeleted.value = newValue;
  }

  RxInt onShipperApprove = 0.obs;

  void updateOnShipperApproval(int newValue) {
    onShipperApprove.value = newValue;
  }

  RxBool onShipperAPIfails = false.obs;
  void retryOnShipperAPIfails(bool newValue) {
    onShipperAPIfails.value = newValue;
  }

  RxBool onShipperDocumentfails = false.obs;
  void retryOnShipperDocumentfails(bool newValue) {
    onShipperDocumentfails.value = newValue;
  }
}
