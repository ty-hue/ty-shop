import 'package:flutter/material.dart';
import 'package:ty_shop/components/Home/HmCategory.dart';
import 'package:ty_shop/components/Home/HmMoreList.dart';
import 'package:ty_shop/components/Home/HmSuggestion.dart';
import 'package:ty_shop/components/Home/HmSlider.dart';
import 'package:ty_shop/components/Home/HmHot.dart';
import 'package:ty_shop/urtils/ToastUtils.dart';
import 'package:ty_shop/viewmodels/home.dart';
import 'package:ty_shop/api/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 滚动控制器
  ScrollController _scrollController = ScrollController();
  // 轮播图数据
  List<BannerItem> _bannerList = [];
  // 分类数据
  List<CategoryItem> _categoryList = [];
  // 特惠推荐数据
  SpecialOffers _specialOffers = SpecialOffers(title: '', id: '', subTypes: []);
  // 热榜推荐数据
  SpecialOffers _inVogueList = SpecialOffers(title: '', id: '', subTypes: []);
  // 一站式推荐数据
  SpecialOffers _oneStopList = SpecialOffers(title: '', id: '', subTypes: []);
  // 推荐列表数据
  List<GoodDetailItem> _recommendList = [];
  // 刷新键
  GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();
  // 页码
  int _page = 1;
  // 是否正在加载
  bool _isLoading = false;
  bool _hasMore = true; // 是否还有更多数据
  @override
  void initState() {
    super.initState();
    _registerEvent();
    Future.microtask(() {
      _key.currentState?.show();
    });
  }

  void _registerEvent() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        _getRecommendList();
      }
    });
  }

  // 获取轮播图数据
  Future<void> _getBannerList() async {
    final res = await getBannerListAPI();
    _bannerList = res;
  }

  // 获取分类列表数据
  Future<void> _getCategoryList() async {
    final res = await getCategoryListAPI();
    _categoryList = res;
  }

  // 获取特惠推荐数据
  Future<void> _getSpecialOffers() async {
    final res = await getSpecialOffersAPI();
    _specialOffers = res;
  }

  // 获取热榜推荐数据
  Future<void> _getInVogue() async {
    final res = await getInVogueAPI();
    _inVogueList = res;
  }

  // 获取一站式推荐数据
  Future<void> _getOneStop() async {
    final res = await getOneStopAPI();
    _oneStopList = res;
  }

  // 获取推荐列表数据
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    int requestLimit = _page * 10;
    final res = await getRecommendListAPI({'limit': requestLimit});
    _isLoading = false;
    setState(() {
      _recommendList = res;
    });
    _page++;
    if (res.length < 10) {
      _hasMore = false;
    }
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
              Expanded(child: HmHot(specialOffers: _inVogueList)),
              SizedBox(width: 10),
              Expanded(child: HmHot(specialOffers: _oneStopList)),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 无限滚动列表
      HmMoreList(goodDetailItems: _recommendList),
    ];
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _hasMore = true;
    _isLoading = false;
    await _getBannerList();
    await _getCategoryList();
    await _getSpecialOffers();
    await _getInVogue();
    await _getOneStop();
    await _getRecommendList();
    setState(() {});
    ToastUtils.showToast(context);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: _getScrollChildren(),
      ),
    );
  }
}
