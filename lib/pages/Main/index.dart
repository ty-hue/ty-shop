import 'package:flutter/material.dart';
import 'package:ty_shop/pages/Cart/index.dart';
import 'package:ty_shop/pages/Category/index.dart';
import 'package:ty_shop/pages/Home/index.dart';
import 'package:ty_shop/pages/Mine/index.dart';
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据，根据数据渲染四个导航
  final List<Map<String, String>> _tabList = [
    {
      'icon': 'lib/assets/ic_public_home_normal.png',
      'active_icon': 'lib/assets/ic_public_home_active.png',
      'text': '首页',
    },
    {
      'icon': 'lib/assets/ic_public_pro_normal.png',
      'active_icon': 'lib/assets/ic_public_pro_active.png',
      'text': '分类',
    },
    {
      'icon': 'lib/assets/ic_public_cart_normal.png',
      'active_icon': 'lib/assets/ic_public_cart_active.png',
      'text': '购物车',
    },
    {
      'icon': 'lib/assets/ic_public_my_normal.png',
      'active_icon': 'lib/assets/ic_public_my_active.png',
      'text': '我的',
    },
  ];
  int _currentIndex = 0; // 当前选中的索引
  // 返回主页视图列表
  List<Widget> _getChildren(){
    return [
      HomeView(),
      CategoryView(),
      CartView(),
      MineView(),
    ];
  }
  // 渲染底部的四个tab项
  List<BottomNavigationBarItem> _getTabBarWidget(){
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!,width: 30,height: 30,),
        activeIcon: Image.asset(_tabList[index]['active_icon']!,width: 30,height: 30,),
        label: _tabList[index]['text'],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea避开安全区
      body: SafeArea(child: 
      IndexedStack(
        index:_currentIndex,
        children: _getChildren(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true, 
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex, // 当前选中的索引
        items: _getTabBarWidget(),
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
