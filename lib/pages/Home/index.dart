import 'package:flutter/material.dart';
import 'package:ty_shop/components/Home/HmMoreList.dart';
import 'package:ty_shop/components/Home/HmSuggestion.dart';
import 'package:ty_shop/components/Home/HmSlider.dart';
import 'package:ty_shop/components/Home/Hmcategory.dart';
import 'package:ty_shop/components/Home/HmHot.dart';
import 'package:ty_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 轮播图数据
 final List<BannerItem> _bannerList = [
    BannerItem(id: '1', imgUrl: 'https://gips1.baidu.com/it/u=595975033,3712432608&fm=3074&app=3074&f=PNG?w=2560&h=1440'),
    BannerItem(id: '2', imgUrl: 'https://img1.baidu.com/it/u=1270113299,345319113&fm=253&app=138&f=JPEG?w=889&h=500'),
    BannerItem(id: '3', imgUrl: 'https://pic.rmb.bdstatic.com/623975e31fb34064900ad236d357fef5.jpeg'),
  ];
  List<Widget> _getScrollChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(banners: _bannerList)),
      // 间隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类
      SliverToBoxAdapter(child: Hmcategory()),
      // 间隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion()),
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
