import 'package:e_com_app/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PanierTile extends StatefulWidget {
  const PanierTile({
    super.key,
  });
  @override
  State<PanierTile> createState() => _PanierTileState();
}

class _PanierTileState extends State<PanierTile> {
  int numbreCmde = 1;
  final NumberFormat format = NumberFormat("#,###", "en");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0.1,
            color: myGrisFonce55,
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/macbook01.jpg",
          width: width / 6,
          fit: BoxFit.cover,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MacBook ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: myGrisFonce,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "MacBook avec puces M3 Garantir 2ans",
              maxLines: 10,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: myGrisFonce,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
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
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Cendre",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: myGrisFonceAA,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: myOrange,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 0.1,
                        color: myGrisFonceAA,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    splashRadius: 5,
                    iconSize: 20,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      if (numbreCmde > 1) {
                        setState(() {
                          --numbreCmde;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: myWhite,
                    ),
                    style: IconButton.styleFrom(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "$numbreCmde",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: myGrisFonce,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: myOrange,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 0.1,
                        color: myGrisFonceAA,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    splashRadius: 5,
                    iconSize: 20,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        ++numbreCmde;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: myWhite,
                    ),
                    style: IconButton.styleFrom(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
