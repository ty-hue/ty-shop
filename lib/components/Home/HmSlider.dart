import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  HmSlider({Key? key}) : super(key: key);

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.red,
      child: Center(child: Text('轮播图')),
    );
  }
}
