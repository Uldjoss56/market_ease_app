class Article {
  const Article({
    required this.pathToImg,
    required this.isLike,
    required this.price,
    required this.name,
    required this.likesCount,
    required this.description,
    this.id,
  });
  final int? id;
  final String pathToImg;
  final bool isLike;
  final String description;
  final int likesCount;
  final int price;
  final String name;
}
