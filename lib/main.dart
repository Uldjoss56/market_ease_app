import 'package:flutter/material.dart';
import 'package:e_com_app/const.dart';
import 'package:e_com_app/features/onboarding/begin.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: myOrange,
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        textTheme: const TextTheme().copyWith(
          displayLarge: const TextStyle(
            //Pour les grands titre
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displayMedium: const TextStyle(
            //Pour les sous titre(FAKE VALUE)
            fontSize: 20,
          ),
          displaySmall: const TextStyle(
            //Pour les petits titre (FAKE VALUE)
            color: Colors.black,
            fontSize: 13,
          ),
          titleMedium: const TextStyle(
            //Pour les textes moyens comme les titres de catégorie,
            color: Colors.black,
            fontSize: 13,
          ),
          labelSmall: const TextStyle(
            //Pour les tout petit texte
            color: Colors.black,
            fontSize: 11,
          ),
          labelMedium: const TextStyle(
            //Pour les moyens texte
            color: Colors.white,
            fontSize: 18,
          ),
          titleLarge: const TextStyle(
            //Pour le textes de appBar si il y en as(FAKE VALUE),
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myYellow,
            foregroundColor: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Begin(),
    ),
  );
}
