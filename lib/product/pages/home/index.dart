import 'package:flutter/material.dart';
import 'package:kt2/product/pages/cart/index.dart';
import 'package:kt2/product/pages/home/body.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppBarIcon(icon, func) {
      return IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        icon: Icon(icon, color: Colors.black),
        onPressed: () {
          func();
        },
      );
    }

    redirectToCart() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          primary: false,
          backgroundColor: Colors.blue[800],
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [AppBarIcon(Icons.menu, null)],
            ),
          ),
          title: Text(
            "SHOP APP",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            AppBarIcon(Icons.shopping_cart_sharp, redirectToCart),
            SizedBox(
              width: 20,
            ),
          ]),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Body(),
        ),
      ),
    );
  }
}
