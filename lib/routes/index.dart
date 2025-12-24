import 'package:flutter/material.dart';
import 'package:ty_shop/pages/Login/index.dart';
import 'package:ty_shop/pages/Main/index.dart';

// 返回路由根组件
Widget getRootWidget(){
  return MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
  );
}

//  返回路由配置
Map<String, Widget Function(BuildContext)> getRoutes(){
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage(),
  };
}
