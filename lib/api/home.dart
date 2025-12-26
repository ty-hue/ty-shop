import 'package:ty_shop/constants/index.dart';
import 'package:ty_shop/urtils/DIoRequest.dart';
import 'package:ty_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async{
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
      return BannerItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
  
}