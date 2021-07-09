class TransporterDetailsModel {
  String? transporterId;
  double? phoneNo;
  String? transporterName;
  String? companyName;
  String? transporterLocation;
  bool? transporterApproved;
  bool? companyApproved;
  bool? accountVerificationInProgress;

  TransporterDetailsModel(
      {this.transporterId,
      this.phoneNo,
      this.transporterName,
      this.companyName,
      this.transporterLocation,
      this.transporterApproved,
      this.companyApproved,
      this.accountVerificationInProgress});
}
