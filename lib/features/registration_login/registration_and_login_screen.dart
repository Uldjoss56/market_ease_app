import 'package:dio/dio.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/home/home.dart';
import 'package:e_com_app/providers/user.dart';
import 'package:e_com_app/services/user_service.dart';
import 'package:e_com_app/widgets/text_form_field_card.dart';
import 'package:e_com_app/widgets/text_form_field_for_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationAndLoginScreen extends ConsumerStatefulWidget {
  const RegistrationAndLoginScreen({
    super.key,
    required this.registrationMode,
  });
  final bool registrationMode;
  @override
  ConsumerState<RegistrationAndLoginScreen> createState() =>
      _RegistrationAndLoginScreenState();
}

class _RegistrationAndLoginScreenState
    extends ConsumerState<RegistrationAndLoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameAndSurnameController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _mailOfConnexionController =
      TextEditingController();
  final TextEditingController _passwordOfConnexionController =
      TextEditingController();

  int _registrationPhase = 1;
  late bool _registrationMode;
  late Widget content;

  bool rememberMe = false;
  bool acceptConditions = false;

  bool isLoading = false;

  final _userService = UserService();

  signUp(data, height) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await _userService.createUser(data);

      successRegistrationShowDialog(height);

      _emailController.text = "";
      _nameAndSurnameController.text = "";
      _confirmPasswordController.text = "";
      _usernameController.text = "";
      _passwordController.text = "";

      return response;
    } on DioException catch (e) {
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
                  "Erreur survenue : veillez à entrer"
                  " des informations correctes.",
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
      if (e.response != null) {
        throw Exception("Error: ${e.response!.data}");
      } else {
        throw Exception("Error: ${e.message}");
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<dynamic> successRegistrationShowDialog(height) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: myWhite,
          surfaceTintColor: myWhite,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          insetAnimationDuration: const Duration(
            seconds: 2,
          ),
          child: SizedBox(
            height: 0.6 * height,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/5566286_orange.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 50,
                        right: 50,
                        left: 50,
                        bottom: 50,
                        child: CircleAvatar(
                          backgroundColor: myOrange,
                          radius: 0.5 * height,
                          child: Icon(
                            Icons.person_2_rounded,
                            color: myWhite,
                            size: 0.1 * height,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "Félicitations !",
                        style: TextStyle(
                          color: myGrisFonce,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Votre inscription est confirmée. Prêt(e) à "
                        "explorer notre univers de shopping en "
                        "ligne ? \nConnecte-toi et ...\nBonne découverte !",
                        style: TextStyle(
                          color: myGrisFonce,
                          //fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  login(data) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _userService.login(data);
      final pref = await SharedPreferences.getInstance();
      pref.setString("userToken", response.accessToken!);

      final user = response.user;
      final userNotifier = ref.read(userProvider.notifier);
      userNotifier.updateUser(user!);

      _mailOfConnexionController.text = "";
      _passwordOfConnexionController.text = "";
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } on DioException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: myGrisFonce,
          content: Text(
            "Erreur",
            style: TextStyle(
              color: myGris,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
      if (e.response != null) {
        throw Exception("Error: ${e.response!.data}");
      } else {
        throw Exception("Error: ${e.message}");
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _registrationMode = widget.registrationMode;
  }

  @override
  void dispose() {
    super.dispose();
    _confirmPasswordController.text;
    _emailController.text;
    _mailOfConnexionController.text;
    _nameAndSurnameController.text;
    _passwordController.text;
    _passwordOfConnexionController.text;
    _usernameController.text;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    if (_registrationPhase == 1 && _registrationMode) {
      content = Column(
        children: [
          TextFormFieldCard(
            hintText: 'Nom et prénoms',
            controller: _nameAndSurnameController,
            prefixIcon: const Icon(color: myGrisFonceAA, Icons.person),
            validator: (value) {
              if (value!.isEmpty) {
                return "Nom, prénoms invalide";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCard(
            hintText: "Nom d'utilisateur",
            controller: _usernameController,
            prefixIcon: const Icon(color: myGrisFonceAA, Icons.person),
            validator: (value) {
              if (value!.isEmpty) {
                return "Nom d'utilisateur invalide";
              }
              return null;
            },
          ),
        ],
      );
    } else if (_registrationPhase == 2 && _registrationMode) {
      content = Column(
        children: [
          TextFormFieldCard(
            hintText: 'Adresse mail',
            controller: _emailController,
            prefixIcon: const Icon(color: myGrisFonceAA, Icons.mail),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email invalide";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldForPassword(
            controller: _passwordController,
            hintText: 'Mot de passe',
            validator: (value) {
              if (value!.isEmpty) {
                return "Mot de passe invalide";
              }
              return null;
            },
          ),
        ],
      );
    } else if (_registrationPhase == 3 && _registrationMode) {
      content = TextFormFieldForPassword(
        validator: (value) {
          if (value!.isEmpty || value != _passwordController.text) {
            "Mot de passe non conforme";
          }
          return null;
        },
        hintText: 'Confirmer mot de passe',
        controller: _confirmPasswordController,
      );
    } else if (_registrationMode == false) {
      content = Column(
        children: [
          TextFormFieldCard(
            hintText: 'Adresse mail',
            controller: _mailOfConnexionController,
            prefixIcon: const Icon(color: myGrisFonceAA, Icons.mail),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email invalide";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldForPassword(
            controller: _passwordOfConnexionController,
            hintText: 'Mot de passe',
            validator: (value) {
              if (value!.isEmpty) {
                return "Mot de passe invalide";
              }
              return null;
            },
          ),
        ],
      );
    }
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        backgroundColor: myWhite,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leading: (_registrationMode && _registrationPhase > 1)
            ? Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _registrationPhase--;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              )
            : null,
      ),
      body: Container(
        color: myWhite,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/ecom_logo_text.png",
                  width: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _registrationMode ? "Créer un compte" : "Se connecter",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                content,
                const SizedBox(
                  height: 20,
                ),
                if (_registrationMode && _registrationPhase == 3)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          const Text(
                            "Se souvenir de moi",
                            style: TextStyle(
                              color: myGrisFonce,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: acceptConditions,
                            onChanged: (value) {
                              setState(() {
                                acceptConditions = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Acceptez les ",
                                    style: TextStyle(
                                      color: myGrisFonce,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Conditions Générales ",
                                        style: TextStyle(
                                          color: myOrangeAA,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "d'Utilisation et la ",
                                    style: TextStyle(
                                      color: myGrisFonce,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Politique de Confidentialité",
                                        style: TextStyle(
                                          color: myOrangeAA,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                  onPressed: (_registrationMode &&
                          _registrationPhase == 3 &&
                          !acceptConditions)
                      ? null
                      : () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            if (_registrationMode) {
                              if (_registrationPhase == 3) {
                                final name = _nameAndSurnameController.text;
                                final username = _usernameController.text;
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                final confPassword =
                                    _confirmPasswordController.text;
                                if (password == confPassword) {
                                  final String response = await signUp(
                                    {
                                      "name": name,
                                      "username": username,
                                      "email": email,
                                      "password": password,
                                      "password_confirmation": confPassword,
                                    },
                                    height,
                                  );

                                  if (response.contains(
                                      "user successfully registered")) {
                                    setState(() {
                                      _registrationMode = false;
                                    });
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      //backgroundColor: Color(0xFF4169E1),
                                      content: Text(
                                        "Mot de passe non correspondant",
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                setState(() {
                                  _registrationPhase++;
                                });
                              }
                            } else {
                              final email = _mailOfConnexionController.text;
                              final password =
                                  _passwordOfConnexionController.text;

                              await login({
                                "email": email,
                                "password": password,
                              });
                            }
                          }
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _registrationMode
                            ? (_registrationPhase == 3
                                ? "S'inscrire"
                                : "Suivant")
                            : "Se connecter",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      isLoading
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: myWhite,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                if (!_registrationMode)
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: myOrange,
                    ),
                    child: const Text("mot de passe oublié"),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _registrationMode
                          ? 'Vou aviez déjà unn compte?'
                          : "Vous n'aviez pas encore de compte?",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _registrationMode = !_registrationMode;
                        });
                      },
                      child: Text(
                        _registrationMode ? 'Connectez vous' : "S'inscrire",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: myOrange, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black, thickness: 0.4),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/logo_facebook.png",
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/logo_google.png",
                            width: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
