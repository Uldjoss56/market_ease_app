import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/const.dart';
import 'package:e_com_app/data.dart';
import 'package:e_com_app/widgets/container_clipper.dart';
import 'package:e_com_app/widgets/custom_bottom_navigator.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});
  @override
  State<Accueil> createState() {
    return _AccueilState();
  }
}

class _AccueilState extends State<Accueil> {
  bool selectedAll = true;
  bool selectedElectronic = false;
  bool selectedFashion = false;
  bool selectedFood = false;
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Godomey, Boulangerie",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, bottom: 15),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Rechercher',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: height * 0.2,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 10),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(255, 196, 193, 193)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Text(
                                  'text $i',
                                  style: const TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: height * 0.2,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 10),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(255, 196, 193, 193)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Text(
                                  'text $i',
                                  style: const TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: height * 0.2,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 10),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(255, 196, 193, 193)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Text(
                                  'text $i',
                                  style: const TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: height * 0.2,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 10),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(255, 196, 193, 193)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Text(
                                  'text $i',
                                  style: const TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Text(
                            "Populaire",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              "voir plus",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      color: myYellow,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipPath(
        clipper: ContainerClipperPart2(),
        child: BottomAppBar(
          child: CustomBottomNavigator(
            bottomData: bottomList,
          ),
        ),
      ),
    );
  }
}
