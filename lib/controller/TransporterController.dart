import 'package:get/get.dart';

class TransporterController extends GetxController {
  RxString choosenTransporterFilter = "Pending".obs;

  void updateOnTransporterFilterValue(String newValue) {
    choosenTransporterFilter.value = newValue;
  }

  RxBool onTransporterDeleted = false.obs;

  void updateOnTransporterDelete(bool newValue) {
    onTransporterDeleted.value = newValue;
  }

  RxInt onTransporterApprove = 0.obs;

  void updateOnTransporterApproval(int newValue) {
    onTransporterApprove.value = newValue;
  }
}
