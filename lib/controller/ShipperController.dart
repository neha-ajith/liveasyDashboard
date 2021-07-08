import 'package:get/get.dart';

class ShipperController extends GetxController {
  RxString choosenShipperFilter = "Pending".obs;

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
}
