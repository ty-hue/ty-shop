import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          child: Center(
            child: Text('商品$index'),
          ),
        );
      },
    );
  }
}
