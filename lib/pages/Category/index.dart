import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('分类'),
    );
  }
}