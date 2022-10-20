import 'package:flutter/material.dart';
import 'package:liveasy_admin/constants/color.dart';
import 'package:liveasy_admin/constants/fontWeight.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({
    Key? key,
    required this.detail,
    required this.title,
  }) : super(key: key);

  final String detail, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontWeight: mediumBoldWeight)),
        SizedBox(width: 5),
        Text(detail, style: TextStyle(color: greyColor)),
      ],
    );
  }
}
