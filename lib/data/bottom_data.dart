import 'package:e_com_app/features/accueil/acceuil.dart';
import 'package:e_com_app/features/favoris_page/favorite_page.dart';
import 'package:e_com_app/features/notification/notification.dart';
import 'package:e_com_app/features/panier/panier.dart';
import 'package:e_com_app/features/profil/profil.dart';
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
    "screen": const Accueil(),
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
    "screen": const FavoritePage(),
  },
  {
    'label': 'Panier',
    'icon': Image.asset(
      'assets/icon/panier.png',
      width: 25,
    ),
    'active_icon': Image.asset(
      'assets/icon/active_panier.png',
      width: 25,
    ),
    "screen": const PanierPage(),
  },
  {
    'label': 'Notifications',
    'icon': Image.asset(
      'assets/icon/notif.png',
      width: 25,
    ),
    'active_icon': Image.asset(
      'assets/icon/actif_notif.png',
      width: 25,
    ),
    "screen": const NotificationPage(),
  },
  {
    'label': 'Profil',
    'icon': Image.asset(
      'assets/icon/profil_2.png',
      width: 25,
    ),
    'active_icon': Image.asset(
      'assets/icon/actif_person.png',
      width: 25,
    ),
    "screen": const Profil(),
  }
  /*
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
    "screen": const NotificationPage(),
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
    "screen": const Profil(),
  }
  */
];
