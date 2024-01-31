import 'package:e_com_app/models/product.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier(List<Product> products) : super(products);

  void updateProducts(List<Product> products) {
    state = products;
  }

  void changeProductFavState(int index) {
    state[index].isfavoriteForUser = true;
  }
}

class ProductsFavoriteNotifier extends StateNotifier<List<Product>> {
  ProductsFavoriteNotifier(List<Product> products) : super(products);

  void updateFavoriteProducts(List<Product> products) {
    state = products;
  }
}

class PanierProductsNotifier extends StateNotifier<List<Product>> {
  PanierProductsNotifier(List<Product> products) : super(products);

  void updatePanierProducts(List<Product> products) {
    state = products;
  }
}

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>(
  (ref) => ProductsNotifier(
    [],
  ),
);

final productsFavoriteProvider =
    StateNotifierProvider<ProductsFavoriteNotifier, List<Product>>(
  (ref) => ProductsFavoriteNotifier(
    [],
  ),
);

final panierProductProvider =
    StateNotifierProvider<PanierProductsNotifier, List<Product>>(
  (ref) => PanierProductsNotifier(
    [],
  ),
);
