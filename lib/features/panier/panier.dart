import 'package:dio/dio.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/command/address_page.dart';
import 'package:e_com_app/features/command_process/code_promo/code_promo.dart';
import 'package:e_com_app/features/panier/widgets/panier_tile.dart';
import 'package:e_com_app/features/registration_login/registration_and_login_screen.dart';
import 'package:e_com_app/models/product.dart';
import 'package:e_com_app/providers/product.dart';
import 'package:e_com_app/providers/user.dart';
import 'package:e_com_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PanierPage extends ConsumerStatefulWidget {
  const PanierPage({super.key});

  @override
  ConsumerState<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends ConsumerState<PanierPage> {
  bool selectAll = false;
  List<bool>? itemSelections;
  List<Product> allPanierProduct = [];

  final _productService = ProductService();

  @override
  void initState() {
    loadProductCard();
    super.initState();
  }

  loadProductCard() async {
    try {
      var response = await _productService.userPanierProducts();
      final panierProductNotifier = ref.read(panierProductProvider.notifier);
      panierProductNotifier.updatePanierProducts(response);
    } on DioException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: myGrisFonce,
          content: Text(
            "Erreur",
            style: TextStyle(
              color: myGris,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
      if (e.response != null) {
        throw Exception("Error: ${e.response!.data}");
      } else {
        throw Exception("Error: ${e.message}");
      }
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    allPanierProduct = ref.watch(panierProductProvider);
    itemSelections = List.generate(
      5,
      (index) => false,
    );
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: user?.email != null
          ? Column(
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
                            style: const TextStyle(
                              color: myGrisFonce,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.search,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Rechercher',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: myGrisFonce22,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: myGrisFonce22,
                                ),
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
                            allPanierProduct.length > 5
                                ? 5
                                : allPanierProduct.length,
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
                                      PanierTile(
                                        product: allPanierProduct[index],
                                      ),
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
                        offset: Offset(0, -1),
                        blurRadius: 1,
                        spreadRadius: 0.1,
                        color: myGrisFonce22,
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
                                          builder: (context) =>
                                              const AddressPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Commander",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
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
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'êtes pas connecté(e)",
                    style: TextStyle(
                      color: myGrisFonceAA,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myOrange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationAndLoginScreen(
                            registrationMode: false,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Connectez-vous",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
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
