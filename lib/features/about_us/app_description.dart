import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class AppDescription extends StatefulWidget {
  const AppDescription({super.key});

  @override
  State<AppDescription> createState() => _AppDescriptionState();
}

class _AppDescriptionState extends State<AppDescription> {
  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Text(
              "MarketEasy est une application mobile de commerce électronique qui"
              " offre une expérience de shopping en ligne pratique et agréable."
              " Cette application a été conçue pour répondre aux besoins variés"
              " des consommateurs modernes, en proposant une large gamme de "
              "produits de haute qualité.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: myGrisFonceAA,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
