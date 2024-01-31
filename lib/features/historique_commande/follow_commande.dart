import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/widgets/dash_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FollowCommande extends StatefulWidget {
  const FollowCommande({super.key});

  @override
  State<FollowCommande> createState() => _FollowCommandeState();
}

class _FollowCommandeState extends State<FollowCommande> {
  final NumberFormat format = NumberFormat("#,###", "en");
  List<String> iconsPath = [
    "assets/icon/box_close.png",
    "assets/icon/bus_to_carer.png",
    "assets/icon/delivery_man.png",
    "assets/icon/box_open.png",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        title: Text(
          "Suivi de la commande",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:15, left: 15, right: 15,),
        child: Column(
          children: [
            Card(
              elevation: 2,
              surfaceTintColor: myWhite,
              child: ListTile(
                leading: Image.asset(
                  "assets/macbook01.jpg",
                  width: width / 6,
                  fit: BoxFit.cover,
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MacBook ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: myGrisFonce,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Nbre = 2",
                      maxLines: 10,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: myGrisFonce,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "\$ ",
                            style: TextStyle(
                              color: myOrange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: format.format(10000),
                            style: const TextStyle(
                              color: myGrisFonce,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      child: Text(
                        "Commander il y a 2jr(s)",
                        style: TextStyle(
                          color: myOrange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) {
                          return Row(
                            children: [
                              ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  myOrange,
                                  BlendMode.srcIn,
                                ),
                                child: Image.asset(
                                  iconsPath[index],
                                  width: width / 10,
                                  height: 50,
                                ),
                              ),
                              if (index != 3)
                                const SizedBox(
                                  width: 40,
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Row(
                              children: [
                                const Icon(
                                  color: myOrange,
                                  Icons.check_circle_rounded,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                if (index != 3)
                                  const DashedLine(
                                    color: myOrange,
                                    size: [
                                      50,
                                      2,
                                    ],
                                  ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Prochaine étape",
                          style: TextStyle(
                            color: myGrisFonce,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Détails de la commande",
                                style: TextStyle(
                                  color: myGrisFonce,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: List.generate(4, (index) {
                                  return ListTile(
                                    leading: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: myWhite,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: myOrange,
                                              width: 3,
                                            ),
                                          ),
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: const BoxDecoration(
                                              color: myOrange,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: index == 3
                                              ? const SizedBox()
                                              : const DashedLine(
                                                  color: myOrange,
                                                  size: [
                                                    22,
                                                    2,
                                                  ],
                                                ),
                                        ),
                                      ],
                                    ),
                                    title: const Text(
                                      "Commande en transit - Dec 17",
                                      style: TextStyle(
                                        color: myGrisFonce,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      "Sikècodji, rue 456, allée 82,"
                                      " maison 201 - Cotonou, Bénin",
                                      style: TextStyle(
                                        color: myGrisFonceAA,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Row(
                              children: [
                                const Text(
                                  "*",
                                  style: TextStyle(
                                    color: myOrange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (index != 4)
                                  const SizedBox(
                                    width: 10,
                                  ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
