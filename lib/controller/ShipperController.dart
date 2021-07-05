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
}
