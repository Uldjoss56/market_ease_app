import 'package:dio/dio.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/models/product.dart';
import 'package:e_com_app/providers/product.dart';
import 'package:e_com_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ArticleCard extends ConsumerStatefulWidget {
  ArticleCard({
    super.key,
    required this.product,
    this.isFavoriteAll,
  });
  bool? isFavoriteAll;
  final Product product;
  @override
  ConsumerState<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends ConsumerState<ArticleCard> {
  final NumberFormat format = NumberFormat("#,###", "en");
  final _productService = ProductService();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.4,
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
              widget.product.photoPath != null
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
                    widget.product.name ?? "Article",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: myGrisFonce),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "XOF ",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: myOrange,
                                  fontWeight: FontWeight.w600,
                                )),
                        TextSpan(
                          text: format.format(widget.product.prix ?? 0000),
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
                          "10 M",
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
                          addPanierProduct(widget.product.id!);
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
              onPressed: (widget.product.isfavoriteForUser != null &&
                      widget.product.isfavoriteForUser != false)
                  ? null
                  : () {
                      setState(() {
                        List<Product> allFavoriteProducts =
                            ref.watch(productsFavoriteProvider);
                        allFavoriteProducts.add(widget.product);

                        final productsFavoriteNotifier =
                            ref.read(productsFavoriteProvider.notifier);
                        productsFavoriteNotifier
                            .updateFavoriteProducts(allFavoriteProducts);

                        addFavoriteProduct(widget.product.id ?? 1);
                      });
                    },
              icon: (widget.product.isfavoriteForUser == null &&
                      widget.isFavoriteAll == null)
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
