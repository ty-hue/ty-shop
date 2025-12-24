import 'package:flutter/material.dart';

class Hmcategory extends StatefulWidget {
  Hmcategory({Key? key}) : super(key: key);

  @override
  State<Hmcategory> createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
      
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            width: 80,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text('分类$index'),
            ),
          ),
        ),
    );
  }
}