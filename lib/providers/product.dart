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

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>(
  (ref) => ProductsNotifier(
    [],
  ),
);

class FavoriteProductsIDNotifier extends StateNotifier<List<String>> {
  FavoriteProductsIDNotifier(List<String> productsID) : super(productsID);

  void updateFavoriteProductsID(List<String> productsID) {
    state = productsID;
  }

  void addFavoriteProductsID(int productID) {
    state.add(productID.toString());
  }
}

final favoriteProductsIDProvider =
    StateNotifierProvider<FavoriteProductsIDNotifier, List<String>>(
  (ref) => FavoriteProductsIDNotifier(
    [],
  ),
);

class PanierProductsIDNotifier extends StateNotifier<List<String>> {
  PanierProductsIDNotifier(List<String> productsID) : super(productsID);

  void updatePanierProductsID(List<String> productsID) {
    state = productsID;
  }

  void addCartProductsID(int productID) {
    state.add(productID.toString());
  }

  void removeCartProductsID(int productID) {
    state.remove(productID.toString());
  }
}

final panierProductsIDProvider =
    StateNotifierProvider<PanierProductsIDNotifier, List<String>>(
  (ref) => PanierProductsIDNotifier(
    [],
  ),
);
