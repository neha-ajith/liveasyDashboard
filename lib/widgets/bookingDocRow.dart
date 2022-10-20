import 'package:flutter/material.dart';
import 'package:liveasy_admin/widgets/bookingDocThumbnail.dart';

class DocumentRow extends StatelessWidget {
  const DocumentRow({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List imageList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DocumentThumbnail(doc: imageList[0] != null ? imageList[0] : 'None'),
        DocumentThumbnail(doc: imageList[1] != null ? imageList[1] : 'None'),
        DocumentThumbnail(doc: imageList[2] != null ? imageList[2] : 'None'),
        DocumentThumbnail(doc: imageList[3] != null ? imageList[3] : 'None'),
      ],
    );
  }
}
