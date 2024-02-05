import 'package:dio/dio.dart';
import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/features/avis/avis.dart';
import 'package:e_com_app/features/product_detail/product_detail.dart';
import 'package:e_com_app/providers/product.dart';
import 'package:e_com_app/services/product_service.dart';
import 'package:e_com_app/widgets/product_to_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ArticleCard extends ConsumerStatefulWidget {
  const ArticleCard({
    super.key,
    required this.productID,
    this.isFavoriteAll,
  });
  final bool? isFavoriteAll;
  final int productID;
  @override
  ConsumerState<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends ConsumerState<ArticleCard> {
  final NumberFormat format = NumberFormat("#,###", "fr");
  bool isAddingProducts = false;
  final _productService = ProductService();

  bool isCartingProducts = false;
  
  bool isDeletingProducts = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final allFavoriteProducts = ref.watch(favoriteProductsIDProvider);
    final allProduct = ref.watch(productsProvider);
    final productsNotifier = ref.read(productsProvider.notifier);
    final product = allProduct[widget.productID];

    if (allFavoriteProducts.contains("${product.id}")) {
      productsNotifier.changeProductFavState(widget.productID);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return const ProductDetailPage();
            },
          ),
        );
      },
      child: Container(
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
                if (product.categorieId == 1)
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      myGrisFonceAA,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      "assets/icon/electronic-1.png",
                      width: width / 3,
                    ),
                  )
                else if (product.categorieId == 2)
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      myGrisFonceAA,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      "assets/icon/fashion-1.png",
                      width: width / 3,
                    ),
                  )
                else if (product.categorieId == 2)
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      myGrisFonceAA,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      "assets/icon/food-1.png",
                      width: width / 3,
                    ),
                  )
                else
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      myGrisFonceAA,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      "assets/icon/all_product-1.png",
                      width: width / 3,
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? "Article",
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
                            text: format.format(product.prix ?? 0000),
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Avis(),
                          ),
                        );
                      },
                      child: Container(
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
                            addCartProduct(product.id!);
                          },
                          icon: isCartingProducts
                              ? const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: CircularProgressIndicator(
                                    color: myWhite,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(
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
              child: isAddingProducts
                  ? const Padding(
                      padding: EdgeInsets.all(4),
                      child: CircularProgressIndicator(
                        color: myOrange,
                        strokeWidth: 2,
                      ),
                    )
                  : IconButton(
                      splashRadius: 5,
                      iconSize: 20,
                      padding: const EdgeInsets.all(0),
                      onPressed: product.isfavoriteForUser == true
                          ? null
                          : () {
                              addFavoriteProduct(product.id!);
                            },
                      icon: (product.isfavoriteForUser == true ||
                              widget.isFavoriteAll == true)
                          ? const Icon(
                              Icons.favorite,
                              color: Color(0xFFFF0000),
                            )
                          : const Icon(
                              Icons.favorite_outline_rounded,
                              color: myGrisFonceAA,
                            ),
                      style: IconButton.styleFrom(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  addFavoriteProduct(int id) async {
    final internetAccess = await checkUserConnexion();
    if (internetAccess) {
      setState(() {
        isAddingProducts = true;
      });

      try {
        final response = await _productService.addUserFavoriteProducts(id);
        final productsFavoriteNotifier =
            ref.read(favoriteProductsIDProvider.notifier);
        productsFavoriteNotifier.addFavoriteProductsID(id);
        return response;
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
          isAddingProducts = false;
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: myGrisFonce,
          content: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: myGris,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Connectez-vous à internet",
                  style: TextStyle(
                    color: myGris,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  addCartProduct(int id) async {
    final internetAccess = await checkUserConnexion();
    if (internetAccess) {
      setState(() {
        isCartingProducts = true;
      });
      try {
        final response = await _productService.addUserCartProducts(id);
        final panierProductsNotifier =
            ref.read(panierProductsIDProvider.notifier);
        panierProductsNotifier.addCartProductsID(id);
        return response;
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
          isCartingProducts = false;
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: myGrisFonce,
          content: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: myGris,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Connectez-vous à internet",
                  style: TextStyle(
                    color: myGris,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  removeCartProduct(int id) async{
    final internetAccess = await checkUserConnexion();
    if (internetAccess) {
      setState(() {
        isDeletingProducts = true;
      });
      try {
        final response = await _productService.removeProductCart(id);
        final panierProductsNotifier =
            ref.read(panierProductsIDProvider.notifier);
        panierProductsNotifier.removeCartProductsID(id);
        return response;
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
          isDeletingProducts = false;
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: myGrisFonce,
          content: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: myGris,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Connectez-vous à internet",
                  style: TextStyle(
                    color: myGris,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
