import 'package:dio/dio.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:e_com_app/models/product.dart';
import 'package:e_com_app/providers/product.dart';
import 'package:e_com_app/services/product_service.dart';
import 'package:e_com_app/widgets/show_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FamousPage extends ConsumerStatefulWidget {
  const FamousPage({super.key});

  @override
  ConsumerState<FamousPage> createState() => _FamousPageState();
}

class _FamousPageState extends ConsumerState<FamousPage> {
  int selected = 0;
  bool isSearching = false;
  final NumberFormat format = NumberFormat("#,###", "fr");
  final _productService = ProductService();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final allProducts = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                style: const TextStyle(
                  color: myGrisFonce,
                ),
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  filled: true,
                  fillColor: myGrisFonce22,
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
              )
            : Text(
                "Tous les produits",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
        scrolledUnderElevation: 0,
        actions: [
          if (!isSearching)
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          IconButton(
            onPressed: () {
              myShowModalBottomSheet(context);
            },
            icon: const RotatedBox(
              quarterTurns: -1,
              child: Icon(
                Icons.tune,
              ),
            ),
          ),
          SizedBox(
            width: width / 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      for (int i = 0; i < myCategories.length; i++) ...[
                        selected == i
                            ? ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: myOrange,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {},
                                label: Text(myCategories[i].title),
                                icon: Image.asset(
                                  myCategories[i].img.toString(),
                                  width: 20,
                                ),
                              )
                            : OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() => selected = i);
                                },
                                icon: Image.asset(
                                  myCategories[i].img.toString(),
                                  width: 20,
                                ),
                                label: Text(myCategories[i].title),
                              ),
                        if (i != myCategories.length - 1)
                          const SizedBox(width: 10),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: List.generate(
                    allProducts.length,
                    (index) {
                      final product = allProducts[index];
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
                                product.photoPath != null
                                    ? Image.asset(
                                        "assets/icon/panier.png",
                                        width: width / 3,
                                      )
                                    : Image.asset(
                                        "assets/boite_grise.png",
                                        width: width / 3,
                                      ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name ?? "",
                                      style: const TextStyle(
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
                                            text: "XOF ",
                                            style: TextStyle(
                                              color: myOrange,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          TextSpan(
                                            text: format.format(product.prix),
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
                                          onPressed: () {
                                            addPanierProduct(product.id!);
                                          },
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
                                onPressed: () {
                                  setState(() {
                                    List<Product> allFavoriteProducts =
                                        ref.watch(productsFavoriteProvider);
                                    allFavoriteProducts.add(product);

                                    final productsFavoriteNotifier = ref.read(
                                        productsFavoriteProvider.notifier);
                                    productsFavoriteNotifier
                                        .updateFavoriteProducts(
                                            allFavoriteProducts);

                                    addFavoriteProduct(product.id ?? 1);
                                  });
                                },
                                icon: (product.isfavoriteForUser == null)
                                    ? const Icon(
                                        Icons.favorite_outline_rounded,
                                        color: myGrisFonceAA,
                                      )
                                    : const Icon(
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
      ),
    );
  }

  addFavoriteProduct(int id) async {
    try {
      var response = await _productService.addUserFavoriteProducts(id);
      final productsFavoriteNotifier =
          ref.read(productsFavoriteProvider.notifier);
      productsFavoriteNotifier.updateFavoriteProducts(response);
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

  addPanierProduct(int id) async {
    try {
      var response = await _productService.addUserCardProducts(id);
      final panierProductsNotifier = ref.read(panierProductProvider.notifier);
      panierProductsNotifier.updatePanierProducts(response);
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
      setState(() {});
    }
  }
}
