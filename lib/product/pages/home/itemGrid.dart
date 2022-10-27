import 'package:flutter/material.dart';
import 'package:kt2/product/model/Product.dart';
import 'package:kt2/product/pages/detail/index.dart';

class ItemGrid extends StatelessWidget {
  ItemGrid({required this.item});

  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    buildTitle(title) {
      return title.length > 15 ? title.substring(0, 15) + '...' : title;
    }

    buildDescription(desc) {
      return desc.length > 50 ? desc.substring(0, 50) + '...' : desc;
    }

    buildIcon(icon, color, bgColor) {
      return ClipOval(
        child: Material(
          color: bgColor, // Button color
          child: InkWell(
            // Splash color
            onTap: () {},
            child: SizedBox(
                width: 30,
                height: 30,
                child: Icon(
                  icon,
                  color: color,
                  size: 15,
                )),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ItemDetail(item: item)));
      },
      child: Container(
        height: 330,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                // Image radius
                child: Image.network(item.image ?? "",
                    height: 150, fit: BoxFit.fill),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          buildTitle(item.title ?? ""),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          buildDescription(item.title ?? ""),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$" + item.price.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        Row(
                          children: [
                            buildIcon(
                                Icons.add_shopping_cart,
                                Color.fromARGB(255, 80, 80, 188),
                                Color(0xffdedeed)),
                          ],
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
