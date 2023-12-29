import 'package:flutter/material.dart';

List<Map<String, dynamic>> bottomList = [
  {
    'label': 'Accueil',
    'icon': Image.asset(
      'assets/icon/home.png',
      width: 25,
    ),
    'active_icon': Image.asset(
      'assets/icon/active_home.png',
      width: 25,
    ),
  },
  {
    'label': 'Favoris',
    'icon': Image.asset(
      'assets/icon/like.png',
      width: 25,
    ),
    'active_icon': Image.asset(
      'assets/icon/active_like.png',
      width: 25,
    ),
  },
  {
    'label': 'Panier',
    'icon': Image.asset(
      'assets/icon/card.png',
      width: 25,
    ),
    'active_icon': Image.asset(
      'assets/icon/active_card.png',
      width: 25,
    ),
  },
  {
    'label': 'Notifications',
    'icon': const Icon(
      Icons.notifications,
      color: Color(0xFF707070),
    ),
    'active_icon': const Icon(
      Icons.notifications,
      color: Colors.white,
    ),
  },
  {
    'label': 'Profil',
    'icon': const Icon(
      Icons.person,
      color: Color(0xFF707070),
    ),
    'active_icon': const Icon(
      Icons.person,
      color: Colors.white,
    ),
  }
];
