import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:e_com_app/providers/product.dart';
import 'package:e_com_app/widgets/article_card.dart';
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
                                  myCategories[i].selImg.toString(),
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
                      return ArticleCard(
                        productID: index,
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

/*
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
*/
}
