import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWid extends StatelessWidget {
  const LoadingWid({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.1 * width,
        vertical: 0.7 * width,
      ),
      child: Card(
        surfaceTintColor: myWhite,
        shadowColor: myGrisFonceAA,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFEE7410),
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
            SizedBox(
              width: 0.1 * width,
            ),
            Image.asset(
              "assets/ecom_logo_text.png",
              width: 0.25 * width,
              height: 0.25 * width,
            ),
          ],
        ),
      ),
    );
  }
}
