import 'package:e_com_app/const.dart';
import 'package:e_com_app/data/bottom_data.dart';
import 'package:e_com_app/features/command/address_page.dart';
import 'package:e_com_app/features/command_process/code_promo/code_promo.dart';
import 'package:e_com_app/features/command_process/follows_cmd/follow_commande.dart';
import 'package:e_com_app/features/panier/widgets/panier_tile.dart';
import 'package:e_com_app/widgets/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  bool selectAll = false;
  List<bool>? itemSelections;

  @override
  void initState() {
    super.initState();
    itemSelections = List.generate(
      5,
      (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myWhite,
        title: Center(
          child: Text(
            'Panier',
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 10,
                      right: 15,
                      bottom: 10,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Rechercher',
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
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
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          value: selectAll,
                          checkColor: myWhite,
                          activeColor: myYellow,
                          side: const BorderSide(
                            color: myYellow,
                            width: 2,
                          ),
                          onChanged: (value) {
                            if (value!) {}
                            setState(() {
                              selectAll = value;
                              itemSelections = List.generate(
                                itemSelections!.length,
                                (index) => value,
                              );
                            });
                          },
                        ),
                        const Text(
                          "Tout",
                          style: TextStyle(
                            color: myGrisFonce,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            bottom: 10,
                            right: 15,
                          ),
                          child: Slidable(
                            startActionPane: ActionPane(
                              motion: const BehindMotion(),
                              extentRatio: 0.2,
                              openThreshold: 0.2,
                              closeThreshold: 0.2,
                              children: [
                                SlidableAction(
                                  backgroundColor: myGris,
                                  icon: Icons.delete,
                                  borderRadius: BorderRadius.circular(20),
                                  onPressed: (context) {},
                                )
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              extentRatio: 0.2,
                              openThreshold: 0.2,
                              closeThreshold: 0.2,
                              children: [
                                SlidableAction(
                                  backgroundColor: myGris,
                                  icon: Icons.delete,
                                  borderRadius: BorderRadius.circular(20),
                                  onPressed: (context) {},
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                const PanierTile(),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 25,
                                    top: 10,
                                  ),
                                  width: 25,
                                  height: 25,
                                  child: Checkbox(
                                    value: itemSelections![index],
                                    checkColor: myWhite,
                                    activeColor: myYellow,
                                    onChanged: (value) {
                                      setState(() {
                                        itemSelections![index] = value!;
                                          checkSelectAll();
                                      });
                                    },
                                    shape: const CircleBorder(),
                                    side: const BorderSide(
                                      color: myYellow,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 15,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: myWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  color: myGrisFonceAA,
                ),
              ],
            ),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.tab_sharp,
                          color: myGrisFonceAA,
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: myGrisFonceAA,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$ 8523,5",
                      style: TextStyle(
                        color: myGrisFonce,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CodePromo(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: myWhite,
                          foregroundColor: myGrisFonceAA,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Entrez un code promo"),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: myOrange,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(),
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigator(
        bottomData: bottomList,
        currentPage: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const FollowCommande(),
            ),
          );
        },
      ),
    );
  }

  void checkSelectAll() {
    setState(() {
      selectAll = itemSelections!.every(
        (element) => element,
      );
    });
  }
}
