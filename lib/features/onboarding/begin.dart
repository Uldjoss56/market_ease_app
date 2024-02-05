import 'package:dio/dio.dart';
import 'package:e_com_app/features/home/home.dart';
import 'package:e_com_app/features/onboarding/onboarding.dart';
import 'package:e_com_app/features/registration_login/login_or_registration.dart';
import 'package:e_com_app/providers/user.dart';
import 'package:e_com_app/services/user_service.dart';
import 'package:e_com_app/widgets/product_to_prefs.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Begin extends ConsumerStatefulWidget {
  const Begin({
    super.key,
    required this.isFirstTime,
  });
  final bool isFirstTime;

  @override
  ConsumerState<Begin> createState() => _BeginState();
}

class _BeginState extends ConsumerState<Begin> {
  final _userService = UserService();
  bool? internetAccess;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("userToken");
      if (widget.isFirstTime) {
        goToNext(0);
      } else {
        if (token == null) {
          goToNext(1);
        } else {
          loginByToken();
        }
      }
    });
  }

  loginByToken() async {
    internetAccess = await checkUserConnexion();
    if (internetAccess == true) {
      setState(() {
        isLoading = true;
      });
      try {
        var user = await _userService.getProfile();
        final prefs = await SharedPreferences.getInstance();
        final userNotifier = ref.read(userProvider.notifier);
        userNotifier.updateUser(user);
        if (user.email == null) {
          goToNext(1);
        } else {
          prefs.setString("userMail", user.email!);
          goToNext(2);
        }
      } on DioException {
        goToNext(1);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: myGrisFonce,
          content: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: myGris,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Connectez-vous à internet",
                  style: TextStyle(
                    color: myGris,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ecom_logo_text.png',
                width: 150,
              ),
              const SizedBox(
                height: 40,
              ),
              if (isLoading)
                SpinKitFadingCircle(
                  size: 60,
                  itemBuilder: (BuildContext context, int index) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFEE7410),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void goToNext(int page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        if (page == 0) {
          return const Onboarding();
        } else if (page == 1) {
          return const LoginOrRegistration();
        } else {
          return const Home();
        }
      }),
    );
  }
}
