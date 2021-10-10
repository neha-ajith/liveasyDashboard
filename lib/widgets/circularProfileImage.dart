import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  String? image;
  double height;
  double width;
  CircularProfileImage({this.image,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: FittedBox(fit: BoxFit.cover,
            child: image != null ? CircleAvatar(backgroundImage: NetworkImage(image!))
                : Image.asset("icons/profile.png")));
  }
}
