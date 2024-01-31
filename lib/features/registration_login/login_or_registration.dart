import 'package:e_com_app/features/home/home.dart';
import 'package:e_com_app/features/registration_login/registration_and_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/const/colors.dart';

class LoginOrRegistration extends StatelessWidget {
  const LoginOrRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/login_or_registration.png'),
              Text(
                'Accédez y via',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                icon: Image.asset(
                  "assets/logo_facebook.png",
                  width: 30,
                ),
                label: const Text("Continuer avec votre compte Facebook"),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                icon: Image.asset(
                  "assets/logo_google.png",
                  width: 30,
                ),
                label: const Text("Continuer avec votre compte google"),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "ou",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegistrationAndLoginScreen(
                        registrationMode: false,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Connectez vous",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vous n'aviez pas encore de compte?",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationAndLoginScreen(
                            registrationMode: true,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "S'inscrire",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: myOrange, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: myOrange,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
                child: const Text("Visitez avant tout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
