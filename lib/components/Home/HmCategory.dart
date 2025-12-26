import 'package:flutter/material.dart';
import 'package:ty_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  // 分类数据
  final List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categoryList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 232, 234),
                borderRadius: BorderRadius.circular(40),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(widget.categoryList[index].picture,width: 40,height: 40,),
                  Text(
                    widget.categoryList[index].name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }
        ),
    );
  }
}