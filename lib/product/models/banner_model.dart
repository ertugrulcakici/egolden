class BannerModel {
  String id;
  String bannerCategoryId;
  String title;
  String imageUrl;
  String linkUrl;
  int order;

  BannerModel({
    required this.id,
    required this.bannerCategoryId,
    required this.title,
    required this.imageUrl,
    required this.linkUrl,
    required this.order,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      bannerCategoryId: json['bannerCategoryId'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      linkUrl: json['linkUrl'],
      order: json['order'],
    );
  }
}
