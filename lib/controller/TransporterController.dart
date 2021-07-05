import 'package:get/get.dart';

class TransporterController extends GetxController {
  RxString choosenTransporterFilter = "All".obs;

  void updateOnTransporterFilterValue(String newValue) {
    choosenTransporterFilter.value = newValue;
  }

  RxBool onTransporterDeleted = false.obs;

  void updateOnTransporterDelete(bool newValue) {
    onTransporterDeleted.value = newValue;
  }
}
