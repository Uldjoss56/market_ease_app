import 'package:e_com_app/features/onboarding/onboarding.dart';
import 'package:e_com_app/features/registration_login/login_or_registration.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/const/colors.dart';

class Begin extends StatefulWidget {
  const Begin({
    super.key,
    required this.isFirstTime,
  });
  final bool isFirstTime;

  @override
  State<Begin> createState() => _BeginState();
}

class _BeginState extends State<Begin> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => widget.isFirstTime
              ? const Onboarding()
              : const LoginOrRegistration(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/ecom_logo_text.png',
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
