import 'package:e_com_app/features/acceuil.dart';
import 'package:e_com_app/features/favoris_page/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/const.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({
    super.key,
    required this.bottomData,
    required this.currentPage,
  });
  final List<Map<String, dynamic>> bottomData;
  final int currentPage;
  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: myOrange,
      unselectedItemColor: const Color(0xFF333333),
      showUnselectedLabels: true,
      elevation: 10,
      onTap: (value) {
        setState(
          () {
            
            if (value == 1) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FavoritePage(),
                ),
              );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Accueil(),
                ),
              );
            }
          },
        );
      },
      currentIndex: widget.currentPage ,
      items: List.generate(
        widget.bottomData.length,
        (index) => BottomNavigationBarItem(
          activeIcon: CircleAvatar(
            backgroundColor: myOrange,
            child: widget.bottomData[index]['active_icon'],
          ),
          label: widget.bottomData[index]['label'],
          icon: widget.bottomData[index]['icon'],
        ),
      ),
    );
  }
}
