import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/registration_login/registration_and_login_screen.dart';
import 'package:e_com_app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myWhite,
        title: Center(
          child: Text(
            'Notifications',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: user?.email != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                    2,
                    (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 0 ? "Aujourd'hui" : "Hier",
                            style: const TextStyle(
                              color: myGrisFonceAA,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Column(
                            children: List.generate(
                              5,
                              (index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    radius: width / 20,
                                    child: const Icon(
                                      Icons.pedal_bike,
                                    ),
                                  ),
                                  title: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Commande annulee",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "La commande 7531598563952 à été annulée. "
                                        "Les remboursements de la dite commande à été traité."
                                        " Un fonds de \$865 sera restitué dans 15 minutes.",
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  subtitle: const Text(
                                    "12 décembre 2023 à 08:45",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'êtes pas connecté(e)",
                    style: TextStyle(
                      color: myGrisFonceAA,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myOrange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationAndLoginScreen(
                            registrationMode: false,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Connectez-vous",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
