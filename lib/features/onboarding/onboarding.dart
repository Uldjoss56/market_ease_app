import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/onboarding/onboarding_data.dart';
import 'package:e_com_app/features/registration_login/login_or_registration.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final Widget _selectedContainer = Container(
    width: 17,
    height: 8,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final Widget _notSelectedContainer = ClipOval(
    child: Container(
      width: 12,
      height: 10,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(141, 0, 0, 0),
            myGris55,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.7,
                child: PageView.builder(
                  itemCount: onboardingData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (index == 0 || index == 2)
                              Image.asset(
                                  onboardingData[index]['pathToImg'].toString()),
                            if (index == 1)
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        onboardingData[index]['pathToImg'][0]
                                            .toString(),
                                        width: 175,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Image.asset(
                                        onboardingData[index]['pathToImg'][1]
                                            .toString(),
                                        width: 175,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: Text(
                                onboardingData[index]['text'].toString(),
                                style: Theme.of(context).textTheme.displayLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentIndex == 0 ? _selectedContainer : _notSelectedContainer,
                  const SizedBox(
                    width: 10,
                  ),
                  currentIndex == 1 ? _selectedContainer : _notSelectedContainer,
                  const SizedBox(
                    width: 10,
                  ),
                  currentIndex == 2 ? _selectedContainer : _notSelectedContainer,
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 128,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  if (currentIndex < onboardingData.length - 1) {
                    setState(() {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    });
                  } else if (currentIndex == onboardingData.length - 1) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginOrRegistration(),
                    ));
                  }
                },
                child: Text(
                  "Suivant",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: myYellow,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 128,
                    vertical: 10,
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginOrRegistration(),
                    ),
                  );
                },
                child: const Text(
                  "Passer",
                  style: TextStyle(
                    color: myOrange,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
