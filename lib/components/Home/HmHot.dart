import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  HmHot({Key? key}) : super(key: key);

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text('热门商品'),
      ),
    );
  }
}
