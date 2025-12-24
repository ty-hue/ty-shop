import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ty_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  HmSlider({Key? key, required this.banners}) : super(key: key);
  final List<BannerItem> banners;

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  Widget _getSlider() {
    // 获取设备屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: widget.banners
          .map(
            (item) => Image.network(
              width: screenWidth,
              height: 300,
              item.imgUrl,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(milliseconds: 3000),
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 轮播图
        _getSlider(),
      ],
    );
  }
}
