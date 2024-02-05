import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> checkUserConnexion() async {
  try {
    final url = Uri.parse(
      '''https://www.google.com''',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

void addOrRemoveProductToFavorite(int id) async {
  final prefs = await SharedPreferences.getInstance();
  final email = prefs.getString("userMail");
  final currentList = prefs.getStringList("favoriteProductsID$email");
  if (currentList == null) {
    prefs.setStringList("favoriteProductsID$email", ["$id"]);
  } else if (currentList.contains("$id")) {
    currentList.remove("$id");
    prefs.setStringList("favoriteProductsID$email", currentList);
  } else {
    currentList.add("$id");
    prefs.setStringList("favoriteProductsID$email", currentList);
  }
}

void addOrRemoveProductToCart(int id) async {
  final prefs = await SharedPreferences.getInstance();
  final currentList = prefs.getStringList("cartProductsID");
  if (currentList == null) {
    prefs.setStringList("cartProductsID", ["$id"]);
  } else if (currentList.contains("$id")) {
    currentList.remove("$id");
    prefs.setStringList("cartProductsID", currentList);
  } else {
    currentList.add("$id");
    prefs.setStringList("cartProductsID", currentList);
  }
}
