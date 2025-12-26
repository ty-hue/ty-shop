// 每一个轮播图的数据类型
class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}

// 根据json编写class对象和工厂转换函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map((e) => CategoryItem.fromJSON(e))
                .toList(),
    );
  }
}
