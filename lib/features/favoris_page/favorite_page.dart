import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/data/category_data.dart';
import 'package:e_com_app/features/registration_login/registration_and_login_screen.dart';
import 'package:e_com_app/providers/product.dart';
import 'package:e_com_app/providers/user.dart';
import 'package:e_com_app/widgets/article_card.dart';
import 'package:e_com_app/widgets/show_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  bool selectedAll = true;
  bool selectedElectronic = false;
  bool selectedFashion = false;
  bool selectedFood = false;
  int selected = 0;
  final NumberFormat format = NumberFormat("#,###", "en");
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final allUserFavoriteProduct = ref.watch(productsFavoriteProvider);
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myWhite,
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
      body: user?.email != null
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 15,
                    bottom: 15,
                    left: 15,
                  ),
                  child: Row(
                    children: [
                      Expanded(
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
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          myShowModalBottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.tune,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: myOrange,
                          foregroundColor: myWhite,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
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
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        allUserFavoriteProduct.length,
                        (index) {
                          return ArticleCard(
isFavoriteAll: true,
                            product: allUserFavoriteProduct[index],
                          );
                        },
                      ),
                    ),
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
}
