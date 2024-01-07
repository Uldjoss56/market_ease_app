import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    required this.color,
    required this.size,
  });
  final Color color;
  final List<double> size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size[0],
      height: size[1],
      child: CustomPaint(
        painter: DashedLinePainter(color: color),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  const DashedLinePainter({
    required this.color,
  });
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5.0;
    double dashSpace = 5.0;
    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
