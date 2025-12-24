import 'package:flutter/material.dart';

class MineView extends StatefulWidget {
  MineView({Key? key}) : super(key: key);

  @override
  State<MineView> createState() => _MineState();
}

class _MineState extends State<MineView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('我的'),
    );
  }
}