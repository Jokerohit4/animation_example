import 'package:flutter/material.dart';

///This class allows for dynamic customization based on the displacement parameter
///and whether the clipping is applied to the left corner or not,
/// as specified by the isLeftCorner boolean flag.



class CustomCornerClipper extends CustomClipper<Path> {
  final double displacement;
  final bool isLeftCorner;
  CustomCornerClipper(this.displacement, {this.isLeftCorner = false});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if(isLeftCorner)
    {
      path.moveTo(0, displacement);
      path.quadraticBezierTo(0, 0, displacement * 10, 0);///top left corner
      path.lineTo(size.width, 0);/// top right
      path.lineTo(size.width, size.height);  ///bottom right
      path.lineTo(0, size.height);///bottom left
    }
    else{
      path.lineTo(0, 0);
      path.lineTo(size.width / 6 - displacement, 0);
      path.quadraticBezierTo(size.width / 6, 0, size.width, displacement);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomCornerClipper oldClipper) => displacement != oldClipper.displacement;
}
