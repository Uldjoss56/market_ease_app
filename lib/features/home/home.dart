import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/bottom_data.dart';
import 'package:e_com_app/features/accueil/acceuil.dart';
import 'package:e_com_app/widgets/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget content = const Accueil();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: content,
      ),
      bottomNavigationBar: CustomBottomNavigator(
        bottomData: bottomList,
        takeCurrentIndex: (currentIndex) {
          setState(() {
            content = bottomList[currentIndex]['screen'];
          });
        },
      ),
      //   Container(
      // decoration: BoxDecoration(boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.05), // Couleur de l'ombre
      //     spreadRadius: 1, // Étalement de l'ombre
      //     blurRadius: 2, // Flou de l'ombre
      //   )
      // ]),
      // child: CurvedNavigationBar(
      //   items: curvedIconData,
      //   index: index,
      //   onTap: (value) {
      //     setState(() {
      //       index = value;
      //       content = bottomList[value]['screen'];
      //     });
      //   },
      //   buttonBackgroundColor: myOrange,
      //   backgroundColor: Colors.transparent,
      // ),
    );
  }
}
