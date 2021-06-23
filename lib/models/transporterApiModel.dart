class TransporterDetailsModal {
  String? transporterId;
  double? phoneNo;
  String? transporterName;
  String? companyName;
  String? transporterLocation;
  String? kyc;
  bool? transporterApproved;
  bool? companyApproved;
  bool? accountVerificationInProgress;

  TransporterDetailsModal(
      {this.transporterId,
      this.phoneNo,
      this.transporterName,
      this.companyName,
      this.transporterLocation,
      this.kyc,
      this.transporterApproved,
      this.companyApproved,
      this.accountVerificationInProgress});
}
