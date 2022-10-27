import 'package:flutter/material.dart';
import 'package:kt2/product/helper/padding.dart';

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
                width: PaddingCustom.horizontal,
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
                            color: Colors.black,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Material(
                      color: Color(0xffF2F2F2), // Button color
                      child: InkWell(
                        // Splash color
                        onTap: () {},
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.grey,
                              size: 20,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xff3D3E70),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: OutlinedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(20),
                          )),
                      child: Text("Buy", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
