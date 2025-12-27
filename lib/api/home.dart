import 'package:ty_shop/constants/index.dart';
import 'package:ty_shop/urtils/DIoRequest.dart';
import 'package:ty_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<SpecialOffers> getSpecialOffersAPI() async {
  return SpecialOffers.fromJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

Future<SpecialOffers> getInVogueAPI() async {
  return SpecialOffers.fromJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

Future<SpecialOffers> getOneStopAPI() async {
  return SpecialOffers.fromJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  return (await dioRequest.get(
            HttpConstants.RECOMMEND_LIST,
            queryParameters: params,
          )
          as List)
      .map((item) {
        return GoodDetailItem.fromJSON(item as Map<String, dynamic>);
      })
      .toList();
}
