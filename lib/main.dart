import 'package:e_com_app/features/onboarding/begin.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: myOrange,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('first_time') ?? true;

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) {
      runApp(
        ProviderScope(
          child: MainApp(
            isFirstTime: isFirstTime,
          ),
        ),
      );
    },
  );

  if (isFirstTime) {
    await prefs.setBool('first_time', false);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.isFirstTime,
  });
  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        textTheme: const TextTheme().copyWith(
          displayLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displayMedium: const TextStyle(
            fontSize: 15,
          ),
          labelSmall: const TextStyle(
            color: Colors.black,
            fontSize: 11,
          ),
          labelMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myYellow,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Begin(
        isFirstTime: isFirstTime,
      ),
    );
  }
}
