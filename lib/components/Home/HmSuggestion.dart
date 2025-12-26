import 'package:flutter/material.dart';
import 'package:ty_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  // 特惠推荐数据
  final SpecialOffers specialOffers;
  HmSuggestion({Key? key, required this.specialOffers}) : super(key: key);

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  // 取前3条
  List<Goods> _getDispkayItems() {
    if (widget.specialOffers.subTypes.isEmpty) return [];
    return widget.specialOffers.subTypes.first.goodsItems.first.items
        .take(3)
        .toList();
  }

  List<Widget> _getChildrenList() {
    List<Goods> items = _getDispkayItems();
    return List.generate(items.length, (index) {
      return Column(
        children: [
          // ClipRRect 可以包裹子元素 裁剪图片 设置圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              // 图片加载失败 显示默认图片
              errorBuilder: (context, error, stackTrace) => Image.asset(
                width: 100,
                height: 140,
                'lib/assets/home_cmd_inner.png',
                fit: BoxFit.cover,
              ),
              items[index].picture,
              width: 60,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 96, 12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '￥${items[index].price}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '精品省攻略',
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_inner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        // height: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage('lib/assets/home_cmd_sm.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: [
                _buildLeft(),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
