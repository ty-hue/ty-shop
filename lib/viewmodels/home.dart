// 每一个轮播图的数据类型
class BannerItem{
   String id;
   String imgUrl;
   BannerItem({required this.id,required this.imgUrl});
   factory BannerItem.fromJSON(Map<String,dynamic> json){
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
   }
}


