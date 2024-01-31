import 'package:e_com_app/const/colors.dart';
import 'package:flutter/material.dart';

class BuyersOpinion extends StatefulWidget {
  const BuyersOpinion({super.key});

  @override
  State<BuyersOpinion> createState() => _BuyersOpinionState();
}

class _BuyersOpinionState extends State<BuyersOpinion> {
  late IconData etoile1 = Icons.star;

  List<Color> iconColor = [
    Colors.grey.withOpacity(0.5),
    Colors.grey.withOpacity(0.5),
    Colors.grey.withOpacity(0.5),
    Colors.grey.withOpacity(0.5),
    Colors.grey.withOpacity(0.5),
  ];

  List<bool> values = [false, false, false];

  int etoileNumber = 0;

  void changeEtoile(int i) {
    etoileNumber = i;

    for (int n = 0; n < i; n++) {
      iconColor[n] = myYellow;
    }

    for (int n = i; n < 5; n++) {
      iconColor[n] = Colors.grey.withOpacity(0.5);
    }
  }

  final TextEditingController _commentController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<String> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> checkText = [
      "Produit conforme à l'image",
      'Bon rapport prix qualité',
      'Livraison dans les temps',
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Image.asset("assets/casque.png"),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                changeEtoile(1);
                              });
                            },
                            child: Icon(
                              etoile1,
                              color: iconColor[0],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                changeEtoile(2);
                              });
                            },
                            child: Icon(
                              etoile1,
                              color: iconColor[1],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                changeEtoile(3);
                              });
                            },
                            child: Icon(
                              etoile1,
                              color: iconColor[2],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                changeEtoile(4);
                              });
                            },
                            child: Icon(
                              etoile1,
                              color: iconColor[3],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1),
                            ],
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                changeEtoile(5);
                              });
                            },
                            child: Icon(
                              etoile1,
                              color: iconColor[4],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 1),
                    child: Text(
                      "Faites savoir au vendeur ce que vous penser de sa boutique !",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.1),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: values[0],
                              activeColor: myOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: const BorderSide(width: 1),
                              onChanged: (value) {
                                setState(() {
                                  values[0] = values[0] ? false : true;
                                  values[0]
                                      ? selectedItem.add(checkText[0])
                                      : selectedItem.remove(checkText[0]);
                                });
                              },
                            ),
                            Text(
                              checkText[0],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: values[1],
                              activeColor: myOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: const BorderSide(width: 1),
                              onChanged: (value) {
                                setState(() {
                                  values[1] = values[1] ? false : true;
                                  values[1]
                                      ? selectedItem.add(checkText[1])
                                      : selectedItem.remove(checkText[1]);
                                });
                              },
                            ),
                            Text(
                              checkText[1],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: values[2],
                              activeColor: myOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: const BorderSide(width: 1),
                              onChanged: (value) {
                                setState(() {
                                  values[2] = values[2] ? false : true;
                                  values[2]
                                      ? selectedItem.add(checkText[2])
                                      : selectedItem.remove(checkText[2]);
                                });
                              },
                            ),
                            Text(
                              checkText[2],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Commentez",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    maxLines: 4,
                    maxLength: 100,
                    controller: _commentController,
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Entrée invalide";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: myOrange),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      hintText: "Description de la Boutique",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myOrange,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.3,
                        vertical: 13,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Soumettre",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
