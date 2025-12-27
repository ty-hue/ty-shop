import 'package:flutter/material.dart';
import 'package:ty_shop/viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  final List<GoodDetailItem> goodDetailItems;
  HmMoreList({Key? key, required this.goodDetailItems}) : super(key: key);

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  Widget _getChildren(int index){
    return SizedBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.goodDetailItems[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset('lib/assets/home_cmd_inner.png',fit: BoxFit.cover,),
              ),
            ),
          ),
          SizedBox(height: 6,),
          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),child: Text(widget.goodDetailItems[index].name,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,color: Colors.black87,),),),
          SizedBox(height: 6,),
          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
             Text.rich(TextSpan(children: [
               TextSpan(text: '¥${widget.goodDetailItems[index].price}',style: TextStyle(fontSize: 14,color: Colors.red,),),
             ])),
          ],)),
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.goodDetailItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: _getChildren(index),
          ),
        );
      },
    );
  }
}
