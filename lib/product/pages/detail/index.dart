import 'package:flutter/material.dart';
import 'package:kt2/product/pages/cart/index.dart';
import 'package:kt2/product/pages/detail/BottomBar.dart';

import '../../model/Product.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail({required this.item});

  final ProductModel item;
  AppBarIcon(icon) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      icon: Icon(icon, color: Colors.black),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.image ?? ""),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            primary: false,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              AppBarIcon(Icons.favorite_outline),
              SizedBox(
                width: 20,
              )
            ]),
      ),
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        child: Text(
                          item.title ?? "",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(
                          item.rating?.rate.toString() ?? "",
                          style: TextStyle(color: Colors.yellow),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "(${item.rating?.count} Reviews)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                    ],
                  ),
                  Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        "\$${item.price}",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ]),
                  ]),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                item.description ?? "",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
      bottomNavigationBar: BottomBar(),
    );
  }
}
