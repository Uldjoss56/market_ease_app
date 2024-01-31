import 'package:e_com_app/models/article.dart';

class SubCategory {
  const SubCategory({
    required this.name,
    required this.img,
    required this.article,
  });
  final String name;
  final String img;
  final List<Article> article;
}
