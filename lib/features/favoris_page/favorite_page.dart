import 'package:e_com_app/const.dart';
import 'package:e_com_app/data.dart';
import 'package:e_com_app/widgets/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool selectedAll = true;
  bool selectedElectronic = false;
  bool selectedFashion = false;
  bool selectedFood = false;

  final NumberFormat format = NumberFormat("#,###", "en");
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:myWhite,
        title: Center(
          child: Text(
            'Favorites',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Rechercher',
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    selectedAll
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myOrange,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text("All"),
                          )
                        : OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {
                              setState(() {
                                selectedFood = false;
                                selectedAll = true;
                                selectedElectronic = false;
                                selectedFashion = false;
                              });
                            },
                            child: const Text("All"),
                          ),
                    const SizedBox(width: 10),
                    selectedElectronic
                        ? ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myOrange,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.abc),
                            onPressed: () {},
                            label: const Text("Electronique"),
                          )
                        : OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedFood = false;
                                selectedAll = false;
                                selectedElectronic = true;
                                selectedFashion = false;
                              });
                            },
                            icon: const Icon(Icons.abc),
                            label: const Text("Electronique"),
                          ),
                    const SizedBox(width: 10),
                    selectedFashion
                        ? ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myOrange,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.abc),
                            onPressed: () {},
                            label: const Text("Fashion"),
                          )
                        : OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {
                              setState(() {
                                selectedFood = false;
                                selectedAll = false;
                                selectedElectronic = false;
                                selectedFashion = true;
                              });
                            },
                            icon: const Icon(Icons.abc),
                            label: const Text("Fashion"),
                          ),
                    const SizedBox(width: 10),
                    selectedFood
                        ? ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myOrange,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.abc),
                            onPressed: () {},
                            label: const Text("Food"),
                          )
                        : OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {
                              setState(() {
                                selectedFood = true;
                                selectedAll = false;
                                selectedElectronic = false;
                                selectedFashion = false;
                              });
                            },
                            icon: const Icon(Icons.abc),
                            label: const Text("Food"),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: List.generate(
                  10,
                  (index) {
                    return Container(
                      width: 0.4 * width,
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(10),
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
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                "assets/laptop_mockup.jpg",
                                width: width / 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Laptop Mock-Up",
                                    style: TextStyle(
                                      color: myGrisFonce,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 4,
                                    ),
                                    width: 90,
                                    padding: const EdgeInsets.all(5),
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
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: myYellow,
                                          size: 18,
                                        ),
                                        Text(
                                          "4,54 M",
                                          style: TextStyle(
                                            color: myGrisFonce,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
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
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: myWhite,
                                        ),
                                        style: IconButton.styleFrom(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigator(
        bottomData: bottomList,
        currentPage: 1,
      ),
    );
  }
}
