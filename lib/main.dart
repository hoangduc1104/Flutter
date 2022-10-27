//@dart=2.9
import 'package:flutter/material.dart';
import 'package:kt2/product/pages/home/index.dart';
import 'package:kt2/product/provider/Cart.dart';
import 'package:kt2/product/provider/Category.dart';
import 'package:kt2/product/provider/Product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProivder()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}
