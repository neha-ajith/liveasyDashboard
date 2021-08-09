import 'package:get/get.dart';

class TransporterController extends GetxController {
//Transporter Details Screen
  RxString choosenTransporterFilter = "All".obs;
  void updateOnTransporterFilterValue(String newValue) {
    choosenTransporterFilter.value = newValue;
  }

  RxBool transporterDeleted = false.obs;
  void updateOnTransporterDeleted(bool newValue) {
    transporterDeleted.value = newValue;
    transporterDeleted.value = false;
  }

//Transporter Update Screen
  RxString transporterName = "".obs;
  void updateTransporterName(String newValue) {
    transporterName.value = newValue;
  }

  RxString transporterLocation = "".obs;
  void updateTransporterLocation(String newValue) {
    transporterLocation.value = newValue;
  }

  RxString transporterCompanyName = "".obs;
  void updateTransporterCompanyName(String newValue) {
    transporterCompanyName.value = newValue;
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

  RxInt transporterAccountVerficationInProgress =
      0.obs; // 1 - Completed // 2 - Pending
  void updateTransporterAccountVerification(int newValue) {
    transporterAccountVerficationInProgress.value = newValue;
  }

  RxInt transporterApprovalStatus = 0.obs; // 1 - Approved // 2 - On Halt
  void updateOnTransporterApproval(int newValue) {
    transporterApprovalStatus.value = newValue;
  }

  RxInt transporterCompanyApprovalStatus = 0.obs; // 1 - Approved // 2 - On Halt
  void updateOnTransporterCompanyApproval(int newValue) {
    transporterCompanyApprovalStatus.value = newValue;
  }

  RxBool transporterAPIfailed = false.obs;
  void retryOnTransporterAPIfail(bool newValue) {
    transporterAPIfailed.value = newValue;
    transporterAPIfailed.value = false;
  }

  RxBool transporterDocumentAPIfailed = false.obs;
  void retryOnTransporterDocumentfail(bool newValue) {
    transporterDocumentAPIfailed.value = newValue;
    transporterDocumentAPIfailed.value = false;
  }
}
