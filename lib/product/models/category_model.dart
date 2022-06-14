class CategoryModel {
  String id;
  String title;
  String? imageUrl;
  String? upperId;

  CategoryModel({
    required this.id,
    required this.title,
    this.imageUrl,
    this.upperId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      upperId: json['upperId'],
    );
  }
}
