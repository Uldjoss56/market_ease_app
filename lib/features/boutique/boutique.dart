import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/historique_commande/historique.dart';
import 'package:flutter/material.dart';
import 'package:e_com_app/data/sub_category_data.dart';

class Boutique extends StatefulWidget {
  const Boutique({super.key});

  @override
  State<Boutique> createState() => _BoutiqueState();
}

class _BoutiqueState extends State<Boutique> {
  bool isActive = true;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final inactiveDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.black.withOpacity(0.3)),
        left: BorderSide(color: Colors.black.withOpacity(0.3)),
        right: BorderSide(color: Colors.black.withOpacity(0.3)),
        top: BorderSide(color: Colors.black.withOpacity(0.3)),
      ),
      shape: BoxShape.circle,
    );
    final activeDecoration = BoxDecoration(
      color: myOrange,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
        )
      ],
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Historique(),
                  ),
                );
              },
              icon: Image.asset("assets/icon/my_history.png", width: 30),
            ),
          ],
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(height: height * 0.3),
                Positioned(
                  bottom: 35,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 77,
                  child: Opacity(
                    opacity: 0.25,
                    child: Image.asset(
                      "assets/market.png",
                      width: width * 0.3,
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: CircleAvatar(
                      backgroundColor: myGrisFonce55,
                      radius: 36,
                      child: Icon(
                        Icons.person_3,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Scott_Boutique",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: const Icon(Icons.arrow_right),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Electronique",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              "4,9",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "(0)",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.05,
                      width: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "50 FCFA",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        subtitle: Text(
                          "Achat min",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.05,
                      width: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Ouvert .",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        subtitle: Text(
                          "Statut",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              child: TabBar(
                indicatorColor: myOrange,
                unselectedLabelColor: Colors.black.withOpacity(0.5),
                tabs: [
                  Tab(
                    child: Text(
                      'Electronique',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Mode',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  electroSubCategoriData.length,
                                  (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: index == currentIndex
                                        ? activeDecoration
                                        : inactiveDecoration,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      icon: Image.asset(
                                        electroSubCategoriData[index]["imgPath"],
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            electroSubCategoriData[currentIndex]["content"],
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "data",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 45,
          width: 45,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: myOrange,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
