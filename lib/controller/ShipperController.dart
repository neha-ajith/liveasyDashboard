import 'package:get/get.dart';

class ShipperController extends GetxController {
// Shipper Details Screen
  RxString choosenShipperFilter = "All".obs;
  void updateOnShipperFilterValue(String newValue) {
    choosenShipperFilter.value = newValue;
  }

  RxBool shipperDeleted = false.obs;
  void updateOnShipperDeleted(bool newValue) {
    shipperDeleted.value = newValue;
    shipperDeleted.value = false;
  }

// Shipper Update Screen
  RxString shipperName = "".obs;
  void updateShipperName(String newValue) {
    shipperName.value = newValue;
  }

  RxString shipperLocation = "".obs;
  void updateShipperLocation(String newValue) {
    shipperLocation.value = newValue;
  }

  RxString shipperCompanyName = "".obs;
  void updateShipperCompanyName(String newValue) {
    shipperCompanyName.value = newValue;
  }

  RxBool identityProofApprovalStatus = false.obs;
  void updateIdentityProofApprovalStatus(bool newValue) {
    identityProofApprovalStatus.value = newValue;
  }

  RxBool addressProofFrontApprovalStatus = false.obs;
  void updateAddressProofFrontApprovalStatus(bool newValue) {
    addressProofFrontApprovalStatus.value = newValue;
  }

  RxBool addressProofBacktApprovalStatus = false.obs;
  void updateAddressProofBackApprovalStatus(bool newValue) {
    addressProofBacktApprovalStatus.value = newValue;
  }

  RxBool companyProofApprovalStatus = false.obs;
  void updateCompanyProofApprovalStatus(bool newValue) {
    companyProofApprovalStatus.value = newValue;
  }

  RxInt shipperAccountVerficationInProgress =
      0.obs; // 1 - Completed // 2 - Pending
  void updateShipperAccountVerification(int newValue) {
    shipperAccountVerficationInProgress.value = newValue;
  }

  RxInt shipperApprovalStatus = 0.obs; // 1 - Approved // 2 - On Halt
  void updateOnShipperApproval(int newValue) {
    shipperApprovalStatus.value = newValue;
  }

  RxBool shipperAPIfailed = false.obs;
  void retryOnShipperAPIfail(bool newValue) {
    shipperAPIfailed.value = newValue;
    shipperAPIfailed.value = false;
  }

  RxBool shipperDocumentAPIfailed = false.obs;
  void retryOnShipperDocumentfail(bool newValue) {
    shipperDocumentAPIfailed.value = newValue;
    shipperDocumentAPIfailed.value = false;
  }
}
