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
import 'package:e_com_app/widgets/loading_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class PanierPage extends ConsumerStatefulWidget {
  const PanierPage({super.key});

  @override
  ConsumerState<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends ConsumerState<PanierPage> {
  bool selectAll = false;

  bool isLoading = false;
  List<bool> itemSelections = [];
  final NumberFormat format = NumberFormat("#,###", "fr");
  double montantTotal = 0;
  final _productService = ProductService();

  @override
  void initState() {
    super.initState();
    loadProductCard();
  }

  loadProductCard() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _productService.userPanierProducts();
      List<String> prdID = response.map((e) {
        String productID = "${e.id}";
        return productID;
      }).toList();
      final panierProductNotifier = ref.read(panierProductsIDProvider.notifier);
      panierProductNotifier.updatePanierProductsID(prdID);
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
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final user = ref.watch(userProvider);
    final allProducts = ref.watch(productsProvider);
    final allPanierProductsID = ref.watch(panierProductsIDProvider);
    List<Product> allPanierProduct = [];
    for (Product product in allProducts) {
      if (allPanierProductsID.contains("${product.id}")) {
        allPanierProduct.add(product);
      }
    }
    itemSelections = List.generate(
      allPanierProduct.length,
      (index) {
        if (itemSelections.isNotEmpty && itemSelections.length >= index) {
          if (itemSelections[index] == true) {
            return true;
          }
        }
        return false;
      },
    );

    if (isLoading) {
      return LoadingWid(
        width: width,
      );
    } else {
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
        body: (user?.email == null)
            ? Center(
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
              )
            : (allPanierProduct.isEmpty)
                ? const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Vide",
                      style: TextStyle(
                        color: myGrisFonceAA,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Column(
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
                                        if (value!) {
                                          setState(() {
                                            montantTotal = 0;
                                            for (Product product
                                                in allPanierProduct) {
                                              montantTotal +=
                                                  product.prix!.toDouble();
                                            }
                                          });
                                        } else {
                                          setState(() {
                                            montantTotal = 0;
                                          });
                                        }
                                        setState(() {
                                          selectAll = value;
                                          itemSelections = List.generate(
                                            itemSelections.length,
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
                                  allPanierProduct.length,
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                                value: itemSelections[index],
                                                checkColor: myWhite,
                                                activeColor: myYellow,
                                                onChanged: (value) {
                                                  setState(() {
                                                    itemSelections[index] =
                                                        value!;
                                                    if (value) {
                                                      montantTotal +=
                                                          allPanierProduct[
                                                                  index]
                                                              .prix!
                                                              .toDouble();
                                                    } else {
                                                      montantTotal -=
                                                          allPanierProduct[
                                                                  index]
                                                              .prix!
                                                              .toDouble();
                                                    }

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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Column(
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "XOF ${format.format(montantTotal)}",
                                    style: const TextStyle(
                                      color: myGrisFonce,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: montantTotal == 0
                                        ? null
                                        : () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CodePromo(),
                                              ),
                                            );
                                          },
                                    style: TextButton.styleFrom(
                                      backgroundColor: myWhite,
                                      foregroundColor: myGrisFonceAA,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Entrez un code promo",
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
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
                                            padding:
                                                const EdgeInsets.symmetric(),
                                            shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          onPressed: montantTotal == 0
                                              ? null
                                              : () {
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
                  ),
      );
    }
  }

  void checkSelectAll() {
    setState(() {
      selectAll = itemSelections.every(
        (element) => element,
      );
    });
  }
}
