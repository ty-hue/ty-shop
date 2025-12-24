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
  // 轮播图当前索引
  int _currentIndex = 0;
  // 轮播图控制器
  final CarouselSliderController _carouselController = CarouselSliderController();
  // 轮播图
  Widget _getSlider() {
    // 获取设备屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _carouselController,
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
        // 切换轮播图时会触发该回调 index为最新的轮播图索引
        onPageChanged: (index, reason){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
  // 搜索框
  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '搜索...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
  //  指示点
  Widget _getIndicator(){
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.banners.length,
          (index) => GestureDetector(
            onTap: (){
              _carouselController.animateToPage(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 6,
              width: _currentIndex == index ? 40 : 20,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color:  _currentIndex == index ? Colors.white : Color.fromRGBO(0, 0, 0, 0.8),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 轮播图
        _getSlider(),
        // 搜索框
        _getSearch(),
        // 指示点
        _getIndicator(),
      ],
    );
  }
}
