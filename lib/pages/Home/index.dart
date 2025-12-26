import 'package:flutter/material.dart';
import 'package:ty_shop/components/Home/HmCategory.dart';
import 'package:ty_shop/components/Home/HmMoreList.dart';
import 'package:ty_shop/components/Home/HmSuggestion.dart';
import 'package:ty_shop/components/Home/HmSlider.dart';
import 'package:ty_shop/components/Home/HmHot.dart';
import 'package:ty_shop/viewmodels/home.dart';
import 'package:ty_shop/api/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 轮播图数据
  List<BannerItem> _bannerList = [];
  // 分类数据
  List<CategoryItem> _categoryList = [];
  // 特惠推荐数据
  SpecialOffers _specialOffers = SpecialOffers(title: '', id:'',subTypes: []);
  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSpecialOffers();
  }
  // 获取轮播图数据
  void _getBannerList() async {
    final res = await getBannerListAPI();
    _bannerList = res;
    setState(() {});
  }
  // 获取分类列表数据
  void _getCategoryList() async{
    final res = await getCategoryListAPI();
    _categoryList = res;
    setState(() {});
  }
  // 获取特惠推荐数据
  void _getSpecialOffers() async{
    final res = await getSpecialOffersAPI();
    _specialOffers = res;
    setState(() {});
  }

  List<Widget> _getScrollChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(banners: _bannerList)),
      // 间隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      // 间隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion(specialOffers: _specialOffers)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      // 爆款商品
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 无限滚动列表
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
