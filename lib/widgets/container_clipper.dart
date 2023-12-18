import 'package:flutter/material.dart';

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double theWidth = size.width;
    final double theHeight = 0.6 * size.height;
    final double curveHeight = theHeight * 1.25;
    final double curveHeightEnd = theHeight * 0.75;
    final double ctrlPtX1 = theWidth * 0.75;
    final double ctrlPtX2 = theWidth * 0.25;
    final double ctrlPtY1 = theHeight * 1;
    final double ctrlPtY2 = theHeight * 1.2;
    final double midPtX = theWidth * 0.5;
    final double midPtY = theHeight * 1.1;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(theWidth, 0)
      ..lineTo(theWidth, curveHeight)
      ..cubicTo(theWidth, curveHeight, ctrlPtX1, ctrlPtY1, midPtX, midPtY)
      ..cubicTo(midPtX, midPtY, ctrlPtX2, ctrlPtY2, 0, curveHeightEnd)
      ..lineTo(0, theHeight)
      ..lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ContainerClipperPart2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;
    final widthSplit = width / 12;
    final heightSplit = height / 4;
    final space = height / 12;

    path
      ..moveTo(0, 0)
      ..quadraticBezierTo(
        widthSplit,
        heightSplit - space,
        2 * widthSplit,
        heightSplit - space,
      )
      ..lineTo(10 * widthSplit, heightSplit - space)
      ..quadraticBezierTo(
        11 * widthSplit,
        heightSplit - space,
        width,
        0,
      )
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
