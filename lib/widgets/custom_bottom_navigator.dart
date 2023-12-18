import 'package:flutter/material.dart';
import 'package:e_com_app/const.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({
    super.key,
    required this.bottomData,
  });
  final List<Map<String, dynamic>> bottomData;
  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: myOrange,
      unselectedItemColor: const Color(0xFF333333),
      showUnselectedLabels: true,
      elevation: 10,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      currentIndex: _selectedIndex,
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
