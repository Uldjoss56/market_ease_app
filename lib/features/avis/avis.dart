import 'package:e_com_app/const.dart';
import 'package:e_com_app/features/avis/write_avis.dart';
import 'package:flutter/material.dart';

class AvisPage extends StatefulWidget {
  const AvisPage({super.key});

  @override
  State<AvisPage> createState() => _AvisPageState();
}

class _AvisPageState extends State<AvisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        backgroundColor: myWhite,
        title: Text(
          "Avis",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(5, (index) {
                          if (index < 3) {
                            return const Icon(
                              Icons.star_rounded,
                              color: myYellow,
                            );
                          } else if (index == 3) {
                            return const Icon(
                              Icons.star_half_rounded,
                              color: myYellow,
                            );
                          } else {
                            return const Icon(
                              Icons.star_border_rounded,
                              color: myYellow,
                            );
                          }
                        }),
                      ),
                      const Text(
                        "1203 notes",
                        style: TextStyle(
                          color: myGrisFonceAA,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "4,9 ",
                          style: TextStyle(
                            color: myGrisFonce,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        ),
                        TextSpan(
                          text: "sur 5",
                          style: TextStyle(
                            color: myGrisFonceAA,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) {
                        return Row(
                          children: [
                            Text(
                              " ${5 - index} ",
                              style: const TextStyle(
                                color: myGrisFonceAA,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.star_rounded,
                              size: 20,
                              color: myYellow,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: 0.67,
                                color: myGrisFonceAA,
                                backgroundColor: myGrisFonce22,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "67 %",
                              style: TextStyle(
                                color: myGrisFonce,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "905 avis",
                        style: TextStyle(
                          color: myGrisFonceAA,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return const WriteAvis();
                              },
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Ecrire un avis",
                              style: TextStyle(
                                color: myGrisFonceAA,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.edit,
                              color: myGrisFonceAA,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                5,
                (index) {
                  return Material(
                    elevation: 10,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: myGrisFonce55,
                            child: ClipOval(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Icon(
                                  Icons.person,
                                  color: myWhite,
                                ),
                              ),
                            ),
                          ),
                          title: const Text(
                            "Lilia Fall",
                            style: TextStyle(
                              color: myGrisFonce,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return const Icon(
                                    Icons.star_rounded,
                                    size: 16,
                                    color: myYellow,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "5 sur 5",
                                style: TextStyle(
                                  color: myGrisFonceAA,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                "5 Janv 2024",
                                style: TextStyle(
                                  color: myGrisFonceAA,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 50,
                          ),
                          child: Text(
                            "Je suis vraiment contente de mon achat. "
                            "L'exemple parfait d'un bon rapport prix qualité.",
                            style: TextStyle(
                              color: myGrisFonce,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
