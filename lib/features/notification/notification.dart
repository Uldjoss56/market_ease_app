import 'package:e_com_app/const.dart';
import 'package:e_com_app/data/bottom_data.dart';
import 'package:e_com_app/widgets/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:myWhite,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              2,
              (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Aujourd'hui",
                      style: TextStyle(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                fontSize: 12,
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
      ),
      bottomNavigationBar: CustomBottomNavigator(
        bottomData: bottomList,
        currentPage: 3,
      ),
    );
  }
}
