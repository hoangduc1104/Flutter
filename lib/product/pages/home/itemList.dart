import 'package:flutter/material.dart';
import 'package:kt2/product/model/Product.dart';
import 'package:kt2/product/pages/detail/index.dart';

class ItemList extends StatelessWidget {
  ItemList({required this.item});

  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    buildTitle(title) {
      var text = title.length > 50 ? title.substring(0, 50) + '...' : title;
      return Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );
    }

    buildDescription(desc) {
      var text = desc.length > 80 ? desc.substring(0, 80) + '...' : desc;
      return Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.grey),
      );
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
        margin: EdgeInsets.only(bottom: 10),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                // Image radius
                child: Image.network(item.image ?? "",
                    width: 100, height: 150, fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        buildTitle(item.title),
                        SizedBox(
                          height: 10,
                        ),
                        buildDescription(item.description),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$" + item.price.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        Row(
                          children: [
                            buildIcon(Icons.add_shopping_cart,
                                Color(0xff3E3E70), Color(0xffdedeed)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
