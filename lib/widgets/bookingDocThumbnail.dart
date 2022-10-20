import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/screens/imageViewer.dart';

class DocumentThumbnail extends StatelessWidget {
  final String doc;
  const DocumentThumbnail({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(ImageViewer(
              docType: 'PAN',
              type: "Transporter",
              idProof: doc,
              idProofApproved: false));
        },
        child: Container(
            height: 86,
            width: 125,
            color: white,
            child: doc == 'None'
                ? Center(child: Text('No Document Uploaded'))
                : Image.network(doc)),
      ),
    );
  }
}
