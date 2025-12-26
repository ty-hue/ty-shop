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

class Goods{
  String id;
  String name;
  String desc;
  String price;
  String picture;
  int orderNum;
  Goods({required this.id,required this.name,required this.desc,required this.price,required this.picture,required this.orderNum});
  factory Goods.fromJSON(Map<String, dynamic> json) {
    return Goods(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      price: json['price'] ?? '',
      picture: json['picture'] ?? '',
      orderNum: json['orderNum'] ?? 0,
    );
  }
}
class GoodsItem{
  int counts;
  int pageSize;
  int pages;
  List<Goods> items;
  GoodsItem({required this.counts,required this.pageSize,required this.pages,required this.items});
  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      items: json['items'] == null
          ? []
          : (json['items'] as List)
                .map((e) => Goods.fromJSON(e))
                .toList(),
    );
  }
}
class SubTypes {
  String id;
  String title;
  List<GoodsItem> goodsItems;
  SubTypes({required this.id,required this.title,required this.goodsItems});
  factory SubTypes.fromJSON(Map<String, dynamic> json) {
    return SubTypes(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      goodsItems: json['goodsItems'] == null
          ? []
          : json['goodsItems'] is List
              ? (json['goodsItems'] as List)
                    .map((e) => GoodsItem.fromJSON(e as Map<String, dynamic>))
                    .toList()
              : json['goodsItems'] is Map
                  ? [GoodsItem.fromJSON(json['goodsItems'] as Map<String, dynamic>)]
                  : [],
    );
  }
}
class SpecialOffers {
   String id;
   String title;
   List<SubTypes> subTypes;
   SpecialOffers({required this.id,required this.title,required this.subTypes});
   factory SpecialOffers.fromJSON(Map<String, dynamic> json) {
    return SpecialOffers(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subTypes: json['subTypes'] == null
          ? []
          : json['subTypes'] is List
              ? (json['subTypes'] as List)
                    .map((e) => SubTypes.fromJSON(e as Map<String, dynamic>))
                    .toList()
              : json['subTypes'] is Map
                  ? [SubTypes.fromJSON(json['subTypes'] as Map<String, dynamic>)]
                  : [],
    );
  }
}


