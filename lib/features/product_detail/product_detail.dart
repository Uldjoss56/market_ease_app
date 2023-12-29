import 'package:e_com_app/const.dart';
import 'package:e_com_app/features/command/address_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int numbreCmde = 1;
  final NumberFormat format = NumberFormat("#,###", "fr");

  List<String> caracteristiqueList = [
    "Moniteur 4K UltraFine de LG",
    "Adaptateur USB-C vers USB",
    "Dimensions, 23,4 cm H x 36,7 cm L ",
    "Magic Keyboard avec pavé numérique ",
    "Câble de charge USB-C (2 m)",
    "Modèle 1,3 GHz",
    "Intel Core i7 bicœur à 1,4 GHz",
    "16 Go de mémoire intégrée LPDDR3 à 1 866 MHz",
    "Taille, 12 pouces (30cm)",
  ];
  List<String> articlesImgPth = [
    "assets/laptop_mockup.jpg",
    "assets/msi.png",
  ];
  bool isTapped01 = true;
  int currentPath = 0;
  List<Map<String, String>> detailList = [
    {
      "Couleur": "Gris satin",
      "Marque": "Apple",
      "Matière": "Boîtier en aluminium hautement recyclable",
      "Poids": "1,4 kg",
      "Autres": "Kit de voyage",
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 25,
                  //top: 25,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width / 5,
                              ),
                              Image.asset(
                                articlesImgPth[currentPath],
                                width: 2 * width / 3,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: myWhite,
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                ),
                                style: IconButton.styleFrom(),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: myWhite,
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Color(0xFFAA0000),
                                ),
                                style: IconButton.styleFrom(),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: myWhite,
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: myYellow,
                                ),
                                style: IconButton.styleFrom(),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: myWhite,
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.store,
                                  color: myOrange,
                                ),
                                style: IconButton.styleFrom(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isTapped01 = true;
                              currentPath = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: myWhite,
                              boxShadow: isTapped01
                                  ? [
                                      const BoxShadow(
                                        color: myOrange55,
                                        offset: Offset(0, 0),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ]
                                  : [],
                              border: Border.all(
                                color: isTapped01 ? myOrangeAA : myGrisFonceAA,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.amber,
                            ),
                            child: Image.asset(
                              "assets/laptop_mockup.jpg",
                              width: isTapped01 ? width / 5 : width / 10,
                              height: isTapped01 ? width / 5 : width / 10,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isTapped01 = false;
                              currentPath = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: myWhite,
                              boxShadow: !isTapped01
                                  ? [
                                      const BoxShadow(
                                        color: myOrange55,
                                        offset: Offset(0, 0),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ]
                                  : [],
                              border: Border.all(
                                color: !isTapped01 ? myOrangeAA : myGrisFonceAA,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.amber,
                            ),
                            child: Image.asset(
                              "assets/msi.png",
                              width: !isTapped01 ? width / 5 : width / 10,
                              height: !isTapped01 ? width / 5 : width / 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ),
          Expanded(
            child: Card(
              elevation: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              const TabBar(
                                tabs: [
                                  Tab(
                                    text: "Produit",
                                  ),
                                  Tab(
                                    text: "Caractéristiques",
                                  ),
                                  Tab(
                                    text: "Détails",
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "MacBook 12 pro max",
                                                        style: TextStyle(
                                                          color: myGrisFonce,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color: myYellow,
                                                                size: 18,
                                                              ),
                                                              Text(
                                                                "4,54 M",
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      myGrisFonce,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "(1203 avis)",
                                                            style: TextStyle(
                                                              color:
                                                                  myGrisFonceAA,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                    top: 4,
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: myWhite,
                                                    borderRadius:
                                                        BorderRadius.all(
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
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        const TextSpan(
                                                          text: "XOF ",
                                                          style: TextStyle(
                                                            color: myOrange,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: format
                                                              .format(10000),
                                                          style:
                                                              const TextStyle(
                                                            color: myGrisFonce,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
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
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Description",
                                                  style: TextStyle(
                                                    color: myGrisFonce,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "L'Apple MacBook 12 est un ultraportable équipé de la"
                                                  "nouvelle génération de processeur Intel Core m et doté d'un"
                                                  "écran 12 pouces. Ultracompact (28,05 x 19,65 x 1,36 cm) et"
                                                  "léger (910 gr), il embarque 256 ou 512 Go de stockage SSD.",
                                                  style: TextStyle(
                                                    color: myGrisFonce,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: List.generate(
                                            caracteristiqueList.length,
                                            (index) {
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "-",
                                                    style: TextStyle(
                                                      color: myGrisFonce,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${caracteristiqueList[index]} \n",
                                                      style: const TextStyle(
                                                        color: myGrisFonce,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: List.generate(
                                            detailList[0].length,
                                            (index) {
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${detailList[0].keys.toList()[index]} : ",
                                                    style: const TextStyle(
                                                      color: myGrisFonce,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${detailList[0][detailList[0].keys.toList()[index]]} \n",
                                                      style: const TextStyle(
                                                        color: myGrisFonce,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.13,
                            vertical: 10,
                          ),
                          backgroundColor: myOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddressPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Commander",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
