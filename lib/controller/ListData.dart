import 'package:get/get.dart';

class ListDataController extends GetxController {
  RxString choosenShipperFilter = "All".obs;
  RxString choosenTransporterFilter = "All".obs;

  void updateOnShipperFilterValue(String newValue) {
    choosenShipperFilter.value = newValue;
  }

  void updateOnTransporterFilterValue(String newValue) {
    choosenTransporterFilter.value = newValue;
  }

  RxBool onShipperDeleted = false.obs;
  RxBool onTransporterDeleted = false.obs;

  void updateOnShipperDelete(bool newValue) {
    onShipperDeleted.value = newValue;
  }

  void updateOnTransporterDelete(bool newValue) {
    onTransporterDeleted.value = newValue;
  }
}
