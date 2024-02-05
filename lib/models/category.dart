import 'package:e_com_app/models/sub_category.dart';

class Category {
  Category({
    required this.title,
    required this.id,
    required this.img,
    required this.subcategory,
    required this.selImg,
  });
  final String title;
  final String id;
  final String img;
  final String selImg;
  final List<SubCategory> subcategory;
}
