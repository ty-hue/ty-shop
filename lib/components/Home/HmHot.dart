import 'package:flutter/material.dart';
import 'package:ty_shop/viewmodels/home.dart';

class HmHot extends StatefulWidget {
  final SpecialOffers specialOffers;
  HmHot({Key? key, required this.specialOffers}) : super(key: key);

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  // 取前2条
  List<Goods> get _items {
    if (widget.specialOffers.subTypes.isEmpty) return [];
    return widget.specialOffers.subTypes.first.goodsItems.first.items
        .take(2)
        .toList();
  }

  // 只显示5个字符 超出部分省略号
  String _getShortName(String name, int limit) {
    if (name.length <= 5) return name;
    return '${name.substring(0, limit)}...';
  }

  List<Widget> _getChildrenList() {
    return _items
        .map(
          (e) => Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  // 图片加载失败 显示默认图片
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    width: 70,
                    height: 110,
                    'lib/assets/home_cmd_inner.png',
                    fit: BoxFit.cover,
                  ),
                  e.picture,
                  width: 70,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _getShortName(e.name, 6),
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 86, 24, 20),
                ),
              ),
            ],
          ),
        )
        .toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.specialOffers.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.specialOffers.subTypes.first.title,
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 107, 146, 84),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(10),
      height: 200,
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _getChildrenList(),
          ),
        ],
      ),
    );
  }
}
