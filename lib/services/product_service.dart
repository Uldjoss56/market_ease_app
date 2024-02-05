import 'package:dio/dio.dart';
import 'package:e_com_app/models/product.dart';
import 'package:e_com_app/services/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  Dio api = Api.api();
  String? responseMessage;

  Future<String> createProduct(Map<String, dynamic> data) async {
    final response = await api.post(
      'auth/register',
      data: data,
    );

    return response.data["message"];
  }

  Future<List<Product>> getAllProducts() async {
    final response = await api.get(
      'product_all',
    );
    final allProducts = (response.data[0] as List).map((prod) {
      Product product = Product.fromJson(prod);
      return product;
    }).toList();
    return allProducts;
  }

  Future<List<Product>> getUserFavoriteProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('userToken') ?? "";

    final options = Options(headers: {
      "Authorization": "Bearer $userToken",
    });

    final response = await api.get(
      'favorites',
      options: options,
    );
    final allFavoriteProducts =
        (response.data["favorites"] as List).map((prod) {
      Product product = Product.fromJson(prod);
      return product;
    }).toList();
    return allFavoriteProducts;
  }

  Future addUserFavoriteProducts(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('userToken') ?? "";

    final options = Options(headers: {
      "Authorization": "Bearer $userToken",
    });

    final response = await api.post(
      'cart/add/$id',
      options: options,
    );
    return response.data["message"];
  }

  Future<List<Product>> userPanierProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('userToken') ?? "";

    final options = Options(headers: {
      "Authorization": "Bearer $userToken",
    });

    final response = await api.get(
      'cart',
      options: options,
    );
    final allCardProducts = (response.data["cartProducts"] as List).map((prod) {
      Product product = Product.fromJson(prod);
      return product;
    }).toList();
    return allCardProducts;
  }

  Future addUserCartProducts(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('userToken') ?? "";
    final options = Options(headers: {
      "Authorization": "Bearer $userToken",
    });

    final response = await api.post(
      'cart/add/$id',
      options: options,
    );
    return response.data["message"];
  }

  Future removeProductCart(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('userToken') ?? "";
    final options = Options(headers: {
      "Authorization": "Bearer $userToken",
    });
    final response = await api.delete(
      'cart/remove_item_to_cart/$id',
      options: options,
    );
    return response;
  }
}
