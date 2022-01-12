import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';
import 'package:liveasy_admin/constants/radius.dart';
import 'package:liveasy_admin/constants/screenSizeConfig.dart';
import 'package:liveasy_admin/widgets/approveButtonWidget.dart';
import 'package:liveasy_admin/widgets/cancelButtonWidget.dart';
import 'package:liveasy_admin/widgets/rejectButtonWidget.dart';

class ImageViewer extends StatelessWidget {
  String type,docType;
  String? idProof;
  bool idProofApproved;

  ImageViewer({required this.docType,required this.type,required this.idProof,required this.idProofApproved});

  // ImageViewer.adhar1(this.aadhar1,{required this.type});
  // ImageViewer.adhar2(this.aadhar2,{required this.type});
  double height = SizeConfig.safeBlockVertical!;
  double width = SizeConfig.safeBlockHorizontal!;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return new Future(() => true);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                  height: height * 950,
                  width: width * 850,
                  padding: EdgeInsets.only(
                      left: width * 30, top: height * 20, right: width * 30),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(radius_2 - 2),
                      border: Border.all(color: greyColor.withOpacity(0.80))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 35,
                            width: width * 100,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('ID Proof',
                                    style: TextStyle(
                                        color: greyColor,
                                        fontWeight: normalWeight,
                                        fontSize: 30)))),
                        SizedBox(height: height * 20),
                        idProof != null
                            ? Container(
                                width: width * 800,
                                height: height * 800,
                                child: Image.network(
                                  idProof!,
                                  fit: BoxFit.fill,
                                ))
                            : Container(
                                width: width * 210,
                                height: height * 140,
                                child: Center(child: Text('NO Image Uploaded'))),
                        // if (idProof != null)
                        //   Column(children: [
                        //     SizedBox(height: height * 15),
                        //     !idProofApproved
                        //         ? Center(child: ApproveButtonWidget(type: type, docType: docType.toString().trim()))
                        //         : Center(child: RejectButtonWidget(type: type, docType: docType.toString().trim()))
                        //   ])
                        Center(child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CancelButtonWidget(),
                        ))
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}