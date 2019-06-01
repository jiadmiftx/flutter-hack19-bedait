import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height); //x,y
    var firstEndPoint = Offset(size.width*0.45, size.height-30);
    var firstControlPoint = Offset(size.width*0.20, size.height-50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height-40.0);
    var secondControlPoint = Offset(size.width*.83, size.height-4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}